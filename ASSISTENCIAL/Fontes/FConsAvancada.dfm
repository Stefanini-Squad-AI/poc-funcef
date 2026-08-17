inherited frmConsAvancada: TfrmConsAvancada
  Left = 0
  Top = 2
  Caption = 'Formulário Padrão para Consulta Avançada'
  ClientHeight = 451
  ClientWidth = 632
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Top = 220
    Width = 632
    Height = 192
    TabOrder = 3
  end
  inherited Dock971: TDock97
    Top = 412
    Width = 632
    inherited tb97Fundo: TToolbar97
      Left = 462
      DockPos = 462
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 294
      DockPos = 294
    end
  end
  object grpResultado: TGroupBox [2]
    Left = 0
    Top = 220
    Width = 632
    Height = 192
    Align = alClient
    Caption = 'Resultado'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object pnlResult: TPanel
      Left = 2
      Top = 18
      Width = 628
      Height = 172
      Align = alClient
      BevelOuter = bvNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
  end
  object pnlConsultar: TPanel [3]
    Left = 0
    Top = 0
    Width = 632
    Height = 220
    Align = alTop
    BevelOuter = bvNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    object anmLupa: TAnimate
      Left = 590
      Top = 164
      Width = 48
      Height = 50
      Active = False
      CommonAVI = aviFindFile
      StopFrame = 23
    end
    object bbtnConsultar: TButton
      Left = 642
      Top = 183
      Width = 85
      Height = 31
      Caption = '&Consultar'
      TabOrder = 1
      OnClick = bbtnConsultarClick
    end
    object pgctrlConsulta: TPageControl
      Left = 3
      Top = 9
      Width = 580
      Height = 205
      ActivePage = tbsAvancada
      TabOrder = 2
      object tbsPrincipal: TTabSheet
        Caption = 'Parâmetros de Consulta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object tbsAvancada: TTabSheet
        Caption = 'Consulta Avançada'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        object lstTabelas: TListBox
          Left = 3
          Top = 3
          Width = 121
          Height = 172
          ItemHeight = 13
          Items.Strings = (
            '[Tabelas]')
          TabOrder = 0
        end
        object pnlPesqAvanc: TPanel
          Left = 129
          Top = 3
          Width = 430
          Height = 172
          BevelOuter = bvLowered
          Caption = 'pnlPesqAvanc'
          TabOrder = 1
          object Label3: TLabel
            Left = 6
            Top = 3
            Width = 33
            Height = 13
            Caption = 'Campo'
          end
          object Label5: TLabel
            Left = 6
            Top = 132
            Width = 46
            Height = 13
            Caption = 'Conteúdo'
          end
          object sbtnOU: TSpeedButton
            Left = 180
            Top = 65
            Width = 25
            Height = 25
            Hint = 'OU'
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              33333333333333333333EEEEEEEEEEEEEEE333FFFFFFFFFFFFF3E00000000000
              00E337777777777777F3E0F77777777770E337F33333333337F3E0F333333333
              70E337F3333F333337F3E0F33303333370E337F3337FF33337F3E0F333003333
              70E337F33377FF3337F3E0F33300033370E337F333777FF337F3E0F333000033
              70E337F33377773337F3E0F33300033370E337F33377733337F3E0F333003333
              70E337F33377333337F3E0F33303333370E337F33373333337F3E0F333333333
              70E337F33333333337F3E0FFFFFFFFFFF0E337FFFFFFFFFFF7F3E00000000000
              00E33777777777777733EEEEEEEEEEEEEEE33333333333333333}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = sbtnOUClick
            OnMouseMove = sbtnOUMouseMove
          end
          object sbtnE: TSpeedButton
            Left = 180
            Top = 30
            Width = 25
            Height = 25
            Hint = 'E '
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              33333333333333333333EEEEEEEEEEEEEEE333FFFFFFFFFFFFF3E00000000000
              00E337777777777777F3E0F77777777770E337F33333333337F3E0F333333333
              70E337F33333333337F3E0F33333333370E337F333FF3F3337F3E0F330030333
              70E337F3377F7FF337F3E0F33003003370E337F3377F77FF37F3E0F330030003
              70E337F3377F777337F3E0F33003003370E337F3377F773337F3E0F330030333
              70E337F33773733337F3E0F33333333370E337F33333333337F3E0F333333333
              70E337F33333333337F3E0FFFFFFFFFFF0E337FFFFFFFFFFF7F3E00000000000
              00E33777777777777733EEEEEEEEEEEEEEE33333333333333333}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = sbtnEClick
            OnMouseMove = sbtnEMouseMove
          end
          object sbtnApagar: TSpeedButton
            Left = 180
            Top = 99
            Width = 25
            Height = 25
            Hint = 'Apagar linha'
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              33333333333333333333EEEEEEEEEEEEEEE333FFFFFFFFFFFFF3E00000000000
              00E337777777777777F3E0F77777777770E337F33333333337F3E0F333333333
              70E337F33333333337F3E0F33333333370E337F3333F3FF337F3E0F333030033
              70E337F3337F77F337F3E0F33003003370E337F3377F77F337F3E0F300030033
              70E337F3777F77F337F3E0F33003003370E337F3377F77F337F3E0F333030033
              70E337F33373773337F3E0F33333333370E337F33333333337F3E0F333333333
              70E337F33333333337F3E0FFFFFFFFFFF0E337FFFFFFFFFFF7F3E00000000000
              00E33777777777777733EEEEEEEEEEEEEEE33333333333333333}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = sbtnApagarClick
          end
          object rgrpSinal: TRadioGroup
            Left = 6
            Top = 93
            Width = 163
            Height = 37
            Columns = 5
            Items.Strings = (
              '='
              '>'
              '<'
              '>='
              '<=')
            TabOrder = 0
          end
          object lstCampo: TListBox
            Left = 6
            Top = 15
            Width = 166
            Height = 76
            ItemHeight = 13
            TabOrder = 1
            OnClick = lstCampoClick
          end
          object edConteudo: TEdit
            Left = 6
            Top = 144
            Width = 166
            Height = 21
            TabOrder = 2
            Text = 'edConteudo'
          end
          object lstResult: TListBox
            Left = 213
            Top = 6
            Width = 208
            Height = 160
            ItemHeight = 13
            TabOrder = 3
          end
        end
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 691
  end
end
