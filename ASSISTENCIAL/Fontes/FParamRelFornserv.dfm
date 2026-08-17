inherited frmParamRelFornserv: TfrmParamRelFornserv
  Left = 158
  Top = 185
  Caption = 'Parâmetros do Relatório de Fornecedores'
  ClientHeight = 298
  ClientWidth = 426
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 426
    Height = 259
    inherited PageControl1: TPageControl
      Width = 416
      Height = 249
      ActivePage = TabSheet1
      Font.Height = -11
      Font.Style = []
      ParentFont = False
      object TabSheet1: TTabSheet
        Caption = 'Parâmetros'
        object GroupBox1: TGroupBox
          Left = 5
          Top = 5
          Width = 225
          Height = 180
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object LABEL1: TLabel
            Left = 10
            Top = 41
            Width = 54
            Height = 13
            Caption = 'Fornecedor'
          end
          object Label3: TLabel
            Left = 90
            Top = 150
            Width = 85
            Height = 13
            Caption = 'Plano Assistencial'
            Visible = False
          end
          object Label2: TLabel
            Left = 10
            Top = 95
            Width = 25
            Height = 13
            Caption = 'CGC '
          end
          object DBCMBPATRO: TwwDBLookupCombo
            Left = 11
            Top = 56
            Width = 202
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'60'#9'NOME')
            LookupTable = qrypatro
            LookupField = 'IDPESSOA'
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
            ShowMatchText = True
          end
          object DBLkpCmbplanass: TwwDBLookupCombo
            Left = 90
            Top = 166
            Width = 202
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'40'#9'NOME')
            LookupTable = qryplanass
            LookupField = 'IDPLANASS'
            TabOrder = 1
            Visible = False
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
            ShowMatchText = True
          end
          object cmMaskEditDlg1: TcmMaskEditDlg
            Left = 12
            Top = 111
            Width = 201
            Height = 21
            TabOrder = 2
            BtnGlyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333300000000
              0000333377777777777733330FFFFFFFFFF033337F3FFF3F3FF733330F000F0F
              00F033337F777373773733330FFFFFFFFFF033337F3FF3FF3FF733330F00F00F
              00F033337F773773773733330FFFFFFFFFF033337FF3333FF3F7333300FFFF00
              F0F03333773FF377F7373330FB00F0F0FFF0333733773737F3F7330FB0BF0FB0
              F0F0337337337337373730FBFBF0FB0FFFF037F333373373333730BFBF0FB0FF
              FFF037F3337337333FF700FBFBFB0FFF000077F333337FF37777E0BFBFB000FF
              0FF077FF3337773F7F37EE0BFB0BFB0F0F03777FF3733F737F73EEE0BFBF00FF
              00337777FFFF77FF7733EEEE0000000003337777777777777333}
            BtnNumGlyphs = 2
            BtnWidth = 17
          end
        end
        object GroupBox2: TGroupBox
          Left = 230
          Top = 5
          Width = 173
          Height = 180
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          object DBCheckBox1: TCheckBox
            Left = 11
            Top = 21
            Width = 97
            Height = 17
            Caption = 'Cliente ?'
            TabOrder = 0
          end
          object DBCheckBox4: TCheckBox
            Left = 11
            Top = 72
            Width = 97
            Height = 17
            Caption = 'Administradora ?'
            TabOrder = 1
          end
          object DBCheckBox2: TCheckBox
            Left = 11
            Top = 38
            Width = 97
            Height = 17
            Caption = 'Patrocinadora ?'
            TabOrder = 2
          end
          object DBCheckBox3: TCheckBox
            Left = 11
            Top = 55
            Width = 151
            Height = 17
            Caption = 'Administrador  de fundos ?'
            TabOrder = 3
          end
          object DBCheckBox5: TCheckBox
            Left = 11
            Top = 89
            Width = 137
            Height = 17
            Caption = 'Emitente de títulos ?'
            TabOrder = 4
          end
          object DBCheckBox6: TCheckBox
            Left = 11
            Top = 105
            Width = 97
            Height = 17
            Caption = 'Banco ?'
            TabOrder = 5
          end
          object DBCheckBox8: TCheckBox
            Left = 11
            Top = 139
            Width = 97
            Height = 17
            Caption = 'Autarquia ?'
            TabOrder = 6
          end
          object DBCheckBox9: TCheckBox
            Left = 11
            Top = 156
            Width = 97
            Height = 17
            Caption = 'Sindicato ?'
            TabOrder = 7
          end
          object DBCheckBox7: TCheckBox
            Left = 11
            Top = 122
            Width = 97
            Height = 17
            Caption = 'Bolsa ?'
            TabOrder = 8
          end
        end
        object RadioGroup1: TRadioGroup
          Left = 5
          Top = 185
          Width = 397
          Height = 33
          Columns = 2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Items.Strings = (
            'Analítica'
            'Sintética')
          ParentFont = False
          TabOrder = 2
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 259
    Width = 426
    inherited tb97Fundo: TToolbar97
      Left = 90
      DockPos = 90
      inherited rbtnimprimir: TBitBtn
        OnClick = rbtnImprimirClick
      end
      inherited rbtnvisualizar: TBitBtn
        OnClick = rbtnVisualizarClick
      end
    end
  end
  inherited cdMestre: TColorDialog
    Left = 273
    Top = 36
  end
  inherited cdCabecalho: TColorDialog
    Left = 294
    Top = 93
  end
  object qrypatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT NOME, IDPESSOA'
      ' FROM PESSOA '
      'WHERE  IDPESSOA'
      'IN'
      '(SELECT IDPESSOA FROM   FORNSERV'
      'WHERE FLGASS = 1)')
    ValidateWithMask = True
    Left = 96
    Top = 37
  end
  object dspatro: TwwDataSource
    DataSet = qrypatro
    Left = 128
    Top = 40
  end
  object qryplanass: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPLANASS , NOME, IDFORNSERV'
      'FROM PLANASS')
    ValidateWithMask = True
    Left = 256
    Top = 93
  end
  object dsplanass: TwwDataSource
    DataSet = qryplanass
    Left = 232
    Top = 32
  end
end
