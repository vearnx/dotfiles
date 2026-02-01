const { Widget } = ags;
const { playerctl } = ags.Service;

Widget.MediaControl = Widget.Box({
    children: [
        Widget.Button({
            child: Widget.Icon({ icon: "media-skip-backward-symbolic" }),
            on_clicked: () => playerctl.previous(),
        }),
        Widget.Button({
            child: Widget.Icon({ icon: "media-playback-start-symbolic" }),
            on_clicked: () => playerctl.playPause(),
        }),
        Widget.Button({
            child: Widget.Icon({ icon: "media-skip-forward-symbolic" }),
            on_clicked: () => playerctl.next(),
        }),
        Widget.Label({
            connections: [[playerctl, label => label.label = playerctl.metadata.title]],
        }),
    ],
});
