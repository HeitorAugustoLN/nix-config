{ pkgs, ... }:
{
  catppuccin.helix.enable = true;

  programs.helix = {
    enable = true;
    defaultEditor = true;

    extraPackages = with pkgs; [
      wl-clipboard-rs
      netcat
      gdtoolkit_4
      nixd
      nixfmt
      rust-analyzer
      rustfmt
      omnisharp-roslyn
    ];

    languages = {
      language = [
        {
          name = "gdscript";
          language-servers = [ "godot" ];
        }
      ];

      language-server = {
        godot = {
          args = [
            "127.0.0.1"
            "6005"
          ];

          command = "nc";
        };
      };
    };

    settings = {
      editor = {
        auto-pairs = false;
        bufferline = "multiple";
        color-modes = true;
        cursorline = true;
        end-of-line-diagnostics = "hint";
        file-picker.hidden = false;
        indent-guides.render = true;
        inline-diagnostics.cursor-line = "warning";
        line-number = "relative";
        lsp.display-inlay-hints = true;
        mouse = false;

        rulers = [
          80
          120
        ];

        soft-wrap.enable = true;
        trim-trailing-whitespace = true;
      };

      keys = {
        normal = {
          "´" = "switch_to_uppercase";
          A-b = "move_prev_sub_word_start";
          A-e = "move_next_sub_word_end";
          A-h = "move_parent_node_start";
          A-l = "move_parent_node_end";
          A-w = "move_next_sub_word_start";
          X = "extend_line_above";
        };

        select = {
          "´" = "switch_to_uppercase";
          A-b = "extend_prev_sub_word_start";
          A-e = "extend_next_sub_word_end";
          A-h = "extend_parent_node_start";
          A-l = "extend_parent_node_end";
          A-w = "extend_next_sub_word_start";
          X = "extend_line_above";
        };
      };
    };
  };
}
