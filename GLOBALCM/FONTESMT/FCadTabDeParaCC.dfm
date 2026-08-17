inherited frmCadTabDeParaCC: TfrmCadTabDeParaCC
  Caption = 'frmCadTabDeParaCC'
  ClientHeight = 382
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Height = 296
    inherited pnlMestre: TPanel
      Height = 89
      object Label1: TLabel
        Left = 16
        Top = 10
        Width = 94
        Height = 13
        Caption = 'Nome da Tabela'
      end
      object Label2: TLabel
        Left = 256
        Top = 10
        Width = 231
        Height = 13
        Caption = 'Campo Referente à Empresa Proprietária'
      end
      object Label3: TLabel
        Left = 256
        Top = 50
        Width = 201
        Height = 13
        Caption = 'Campo Referente à Data (histórica)'
      end
      object cboTabela: TwwDBLookupCombo
        Left = 16
        Top = 24
        Width = 225
        Height = 21
        DropDownAlignment = taLeftJustify
        LookupField = 'TABLE_NAME'
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
      end
      object cboPlano: TComboBox
        Left = 256
        Top = 24
        Width = 225
        Height = 21
        ItemHeight = 13
        TabOrder = 1
      end
      object ComboBox1: TComboBox
        Left = 256
        Top = 64
        Width = 225
        Height = 21
        ItemHeight = 13
        TabOrder = 2
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 94
      Height = 197
      inherited pgctrlDetalhe: TPageControl
        Height = 138
        inherited tbsDet: TTabSheet
          inherited dbgrdDet: TwwDBGrid [0]
            Height = 110
          end
          inherited pnlControlesDet: TPanel [1]
            Height = 110
            object Label5: TLabel
              Left = 16
              Top = 16
              Width = 144
              Height = 13
              Caption = 'Campo da Conta Contábil'
            end
            object cboConta: TComboBox
              Left = 16
              Top = 32
              Width = 281
              Height = 21
              Style = csDropDownList
              ItemHeight = 13
              TabOrder = 0
            end
          end
        end
      end
      inherited Dock974: TDock97
        Height = 138
      end
    end
  end
  inherited Dock971: TDock97
    Top = 343
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 976
    Top = 56
  end
  inherited ds: TwwDataSource
    Left = 336
    Top = 0
  end
  inherited ImlPadrao: TImageList
    Left = 976
    Top = 8
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 384
    Top = 0
  end
  inherited Cds: TCMClientDataSet
    Left = 304
    Top = 0
  end
  inherited MontaSelect: TMontaSelect
    Left = 256
    Top = 0
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 456
    Top = 0
  end
  inherited dsDet: TwwDataSource
    Left = 504
    Top = 0
  end
end
