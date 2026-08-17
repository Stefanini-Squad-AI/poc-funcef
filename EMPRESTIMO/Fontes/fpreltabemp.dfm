inherited frmPRelTabEmp: TfrmPRelTabEmp
  Left = 202
  Top = 168
  Caption = 'Relatório das Tabelas de Cadastro'
  ClientHeight = 258
  ClientWidth = 441
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 441
    Height = 219
    object Label1: TLabel [0]
      Left = 15
      Top = 12
      Width = 196
      Height = 23
      Caption = 'Tabelas Disponíveis:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'Bookman Old Style'
      Font.Style = [fsItalic]
      ParentFont = False
    end
    inherited PageControl1: TPageControl
      Width = 431
      Height = 209
      inherited TabSheet2: TTabSheet
        inherited BitBtn1: TBitBtn
          Top = 96
        end
        inherited BitBtn2: TBitBtn
          Top = 36
        end
      end
      object TabSheet1: TTabSheet
        Caption = 'Tabelas'
        object rgTabelas: TRadioGroup
          Left = 10
          Top = 8
          Width = 370
          Height = 160
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ItemIndex = 0
          Items.Strings = (
            'Tipos de Empréstimo'
            'Tipos de Contrato'
            'Tipos de Renegociação'
            'Itens de Recebimento de Crédito'
            'Itens de Despesa de Crédito')
          ParentFont = False
          TabOrder = 0
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 219
    Width = 441
    inherited TbBtnRel: TToolbar97
      inherited rbtnVisualizar: TBitBtn
        OnClick = rbtnVisualizarClick
      end
    end
  end
  inherited cdMestre: TColorDialog
    Left = 273
    Top = 76
  end
  inherited cdCabecalho: TColorDialog
    Left = 318
    Top = 125
  end
end
