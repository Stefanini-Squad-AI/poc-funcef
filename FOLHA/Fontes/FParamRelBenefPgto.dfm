inherited frmBenefPgto: TfrmBenefPgto
  Left = 152
  Top = 114
  HelpContext = 180092
  Caption = 'Benefícos Pagos por Filial'
  ClientHeight = 179
  ClientWidth = 480
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 480
    Height = 140
    object GroupBox2: TGroupBox
      Left = 38
      Top = 22
      Width = 389
      Height = 43
      Caption = ' Patrocinadora '
      TabOrder = 0
      object dbcmbPatrocinadora: TwwDBLookupCombo
        Left = 10
        Top = 14
        Width = 368
        Height = 21
        AutoSize = False
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'60'#9'NOME')
        LookupTable = qryPatrocinadora
        LookupField = 'IDPESSOA'
        DropDownCount = 4
        DropDownWidth = 80
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
      end
    end
    object grpMesRef: TGroupBox
      Left = 152
      Top = 71
      Width = 171
      Height = 45
      Caption = 'Mês e Ano'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object cmbMes: TComboBox
        Left = 7
        Top = 16
        Width = 100
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 13
        ParentFont = False
        TabOrder = 0
        Items.Strings = (
          'Janeiro'
          'Fevereiro'
          'Março'
          'Abril'
          'Maio'
          'Junho'
          'Julho'
          'Agosto'
          'Setembro'
          'Outubro'
          'Novembro'
          'Dezembro')
      end
      object spedAno: TSpinEdit
        Left = 114
        Top = 16
        Width = 50
        Height = 22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxValue = 0
        MinValue = 0
        ParentFont = False
        TabOrder = 1
        Value = 0
      end
    end
  end
  inherited Dock971: TDock97
    Top = 140
    Width = 480
    inherited tb97Fundo: TToolbar97
      Left = 169
      DockPos = 169
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 0
      DockPos = 0
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 291
    Top = 27
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryPatrocinadora: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PE.IDPESSOA, PE.NOME'
      'FROM PESSOA PE, PATRO PA'
      'WHERE  PE.IDPESSOA = PA.IDPESSOA'
      'ORDER BY PE.NOME'
      ' '
      '')
    ValidateWithMask = True
    Left = 416
    Top = 100
  end
end
