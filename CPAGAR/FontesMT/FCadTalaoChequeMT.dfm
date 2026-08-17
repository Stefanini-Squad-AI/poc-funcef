inherited FrmCadTalaoChequeMT: TFrmCadTalaoChequeMT
  Left = 432
  Top = 162
  Caption = 'Controle de Talões de Cheque'
  ClientHeight = 295
  ClientWidth = 345
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 345
    Height = 209
    object lblPortadorConta: TLabel
      Left = 22
      Top = 14
      Width = 125
      Height = 13
      Caption = 'Conta Bancária\Caixa'
    end
    object Label1: TLabel
      Left = 22
      Top = 65
      Width = 73
      Height = 13
      Caption = 'Nº do Talão:'
    end
    object Label2: TLabel
      Left = 181
      Top = 65
      Width = 132
      Height = 13
      Caption = 'Próximo Nº de Cheque:'
    end
    object dblkcmbPortadorContar: TwwDBLookupCombo
      Left = 22
      Top = 32
      Width = 296
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'35'#9'DESCRICAO')
      DataField = 'CODPORTADOR'
      DataSource = ds
      LookupTable = CdsPortadorConta
      LookupField = 'CODPORTADOR'
      Style = csDropDownList
      DropDownWidth = 370
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object EdtNumTalao: TDBRealEdit
      Left = 22
      Top = 80
      Width = 137
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '0')
      TabOrder = 1
      WordWrap = False
      IntDigits = 10
      DecDigits = 0
      NumberFormat = fFixed
      Signal = False
      DataField = 'NUMTALAO'
      DataSource = ds
    end
    object EdtProxCheque: TDBRealEdit
      Left = 181
      Top = 80
      Width = 137
      Height = 21
      Alignment = taRightJustify
      Color = 12320767
      Lines.Strings = (
        '0')
      ReadOnly = True
      TabOrder = 2
      WordWrap = False
      IntDigits = 10
      DecDigits = 0
      NumberFormat = fFixed
      Signal = False
      DataField = 'NUMPROXIMOCHEQUE'
      DataSource = ds
    end
    object GroupBox1: TGroupBox
      Left = 21
      Top = 113
      Width = 297
      Height = 73
      Caption = ' Faixa de Cheques do Talão '
      TabOrder = 3
      object Label3: TLabel
        Left = 11
        Top = 19
        Width = 35
        Height = 13
        Caption = 'Inicial'
      end
      object Label4: TLabel
        Left = 151
        Top = 19
        Width = 28
        Height = 13
        Caption = 'Final'
      end
      object EdtCqInicial: TDBRealEdit
        Left = 11
        Top = 40
        Width = 137
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '0')
        TabOrder = 0
        WordWrap = False
        IntDigits = 10
        DecDigits = 0
        NumberFormat = fFixed
        Signal = False
        DataField = 'NUMCHEQUEINICIAL'
        DataSource = ds
      end
      object EdtCqFinal: TDBRealEdit
        Left = 151
        Top = 40
        Width = 137
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '0')
        TabOrder = 1
        WordWrap = False
        IntDigits = 10
        DecDigits = 0
        NumberFormat = fFixed
        Signal = False
        DataField = 'NUMCHEQUEFINAL'
        DataSource = ds
      end
    end
  end
  inherited Dock972: TDock97
    Width = 345
  end
  inherited Dock971: TDock97
    Top = 256
    Width = 345
    inherited tb97Fundo: TToolbar97
      Left = 173
      DockPos = 176
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 4
      DockPos = 7
    end
  end
  inherited ds: TwwDataSource
    Left = 144
    Top = 142
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 262
    Top = 10
  end
  inherited Cds: TCMClientDataSet
    Left = 84
    Top = 143
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'CHEQUES.NUMTALAO'
      'PORTADORCONTA.DESCRICAO')
    TipodeDado.Strings = (
      'N'
      'C')
    Descricao.Strings = (
      'Número do Talão'
      'Contas Bancárias x Caixa')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'CHEQUES'
      'PORTADORCONTA')
    CamposChave.Strings = (
      'CHEQUES.IDCHEQUES')
    Filtro.Strings = (
      'CHEQUES.CODPORTADOR = PORTADORCONTA.CODPORTADOR')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '50')
    Left = 182
    Top = 238
  end
  object CdsTestaFaixa: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 276
    Top = 175
  end
  object CdsPortadorConta: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 268
    Top = 79
  end
end
