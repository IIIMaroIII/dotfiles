check_ffmpeg() {
    if command -v ffmpeg &>/dev/null; then
        echo "✅  FFmpeg is already installed at: $(command -v ffmpeg)"
        return
    fi

    echo "❌ FFmpeg is not installed."
    read -rp "🔍  Do you want to install it deom source [y/n]: " confirm
    
    if [[ ! "$confirm" =~ ^[yY]$ ]]; then
        echo "⚠️   FFmpeg is required. Exiting..."
        exit 1
    fi 
    
    
    #Prepare downloading
    ffmpeg_ver="7.1.1"
    ffmpeg_name="ffmpeg-${ffmpeg_ver}.tar.xz"
    ffmpeg_url="https://ffmpeg.org/releases/${ffmpeg_name}"
    download_dir="$HOME/Downloads"
    build_dir="$download_dir/ffmpeg-${ffmpeg_ver}"

    echo "➡️   Downloading FFmpeg $ffmpeg_ver..."
    curl -L -o "$download_dir/$ffmpeg_name" "$ffmpeg_url" || {
        echo "❌ Failed to download FFmpeg"
        exit 1
}
    
    echo "📦  Extracting..."
    cd "$download_dir" || exit 1
    tar -xf "$ffmpeg_name" || {
        echo "❌ Failed to extract archive"
        exit 1
} 

    if ! command -v nasm &>/dev/null || ! command -v yasm &>/dev/null; then
        brew install nasm yasm || {
            echo "❌ nasm or yasm had not been installed. Exiting..."
            exit 1
}
    fi 

    echo "🛠 Configuring build..."
    cd "$build_dir" || exit 1
    brew install pkg-config x265 x264 fdk-aac libvpx || {
        echo "❌ Failed to install required dependecies via Homebrew"
        exit 1
}
    ./configure --enable-gpl --enable-libx265 --enable-libx264 --enable-libvpx --enable-libfdk-aac --enable-nonfree || {
        echo "❌ Configure step failed"
        exit 1
}    

    echo "⚙️  Building (this may take a few minutes)..."
    make -j"$(sysctl -n hw.ncpu)" || {
        echo "❌ Build failed"
        exit 1
}

    echo "📥  Installing..."
    sudo make install || {
        echo "❌ Install failed"
        exit 1
}

    echo "✅  FFmpeg $ffmpeg_ver installed successfully!"
    ffmpeg -version | head -n 1
}


#============== Git ==============


#============== Add GNU tools to PATH ==============
add_gnu_tools_to_path() {
	gnu_formulas=(coreutils findutils grep gawk gnu-sed)
	for formula in "${gnu_formulas[@]}"; do
		gnubin_path="/usr/local/opt/$formula/libexec/gnubin"
		if [[ -d "$gnubin_path" && ":$PATH:" != *":$gnubin_path:"* ]]; then
		 export PATH="$gnubin_path:$PATH"
		fi
	done
}
#============== Add GNU tools to PATH ==============

#============== get current status of git repo ==============
function parse_git_dirty {
	status=`git status 2>&1 | tee`
	dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
	untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
	ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
	newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
	renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
	deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
	bits=''
	if [ "${renamed}" == "0" ]; then
		bits=">${bits}"
	fi
	if [ "${ahead}" == "0" ]; then
		bits="*${bits}"
	fi
	if [ "${newfile}" == "0" ]; then
		bits="+${bits}"
	fi
	if [ "${untracked}" == "0" ]; then
		bits="?${bits}"
	fi
	if [ "${deleted}" == "0" ]; then
		bits="x${bits}"
	fi
	if [ "${dirty}" == "0" ]; then
		bits="!${bits}"
	fi
	if [ ! "${bits}" == "" ]; then
		echo " ${bits}"
	else
		echo ""
	fi
}

#============== get current status of git repo ==============
