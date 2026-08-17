inherited FrmCadastroGridCSInv: TFrmCadastroGridCSInv
  Left = 156
  Top = 171
  Caption = 'FrmCadastroGridCSInv'
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    object Bevel2: TBevel [0]
      Left = 1
      Top = 42
      Width = 550
      Height = 3
      Align = alTop
      Shape = bsBottomLine
    end
    inherited pnlControles: TPanel
      Top = 45
      Height = 166
    end
    inherited dbGrd: TwwDBGrid
      Top = 45
      Height = 166
    end
    object pnlTitulo: TPanel
      Left = 1
      Top = 1
      Width = 550
      Height = 41
      Align = alTop
      TabOrder = 2
      object lbNomItem: TfcLabel
        Left = 16
        Top = 8
        Width = 205
        Height = 24
        Caption = 'Descrição da Tabela'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        TextOptions.Alignment = taLeftJustify
        TextOptions.Style = fclsRaised
        TextOptions.VAlignment = vaTop
      end
    end
  end
  inherited Dock971: TDock97
    inherited tb97Fundo: TToolbar97
      Left = 380
      DockPos = 402
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 211
      DockPos = 233
    end
    inline fraMens: TfraMensagem
      Width = 209
      Height = 37
      TabOrder = 2
      inherited pnlProgresso: TPanel
        Width = 209
        Height = 37
        inherited pnlProgressoMensagem: TPanel
          Width = 144
          Height = 35
          inherited lblProgressoMensagem: TfcLabel
            Width = 142
            Height = 33
          end
        end
        inherited pnlProgressoBarra: TPanel
          Left = 145
          Width = 63
          Height = 35
          inherited pgbProcesso: TProgressBar
            Width = 61
            Height = 33
          end
        end
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 264
    Top = 6
  end
  inherited ds: TwwDataSource
    Left = 387
    Top = 6
  end
  inherited upd: TUpdateSQL
    Left = 427
    Top = 6
  end
  inherited MontaSelect: TMontaSelect
    Left = 509
    Top = 6
  end
  inherited ImlPadrao: TImageList
    Left = 305
    Top = 6
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 468
    Top = 6
  end
  inherited qry: TwwQuery
    Left = 346
    Top = 6
  end
end
