
using Plots
using GeoJSON
using DataFrames

jsonbytes = read("prefectures.geojson") # ここでダウンロードしたファイルを指定
japan = GeoJSON.read(jsonbytes)
df = DataFrame(japan)
plot(df[:, :geometry], fmt=:png)

# 日本全体を描写
plot(
    df[:, :geometry],
    xlims=(127, 149),
    ylims=(30, 46),
    ticks=false,
    framestyle=:none,
    foreground_color=:transparent,
    background_color=:transparent,
    fmt=:png,
    size=(420, 420),
    fill="#3FBCBC",
    lc="#FFFFFF",
    lw=0.5
)

plot!(
    df[[1, 4, 11, 13, 27, 28, 40], :geometry],
    fill="#BC1C5F"
)

savefig("Japan.png")