inherited FrmMTCadTermo: TFrmMTCadTermo
  Left = 127
  Top = 129
  HelpContext = 50064
  Caption = 'Termo de Inventário'
  ClientHeight = 357
  ClientWidth = 549
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 549
    Height = 271
    object RagTermo: TDBRadioGroup
      Left = 24
      Top = 16
      Width = 505
      Height = 41
      Caption = ' Termo de '
      Columns = 2
      DataField = 'FLGABREFECHA'
      DataSource = ds
      Items.Strings = (
        'Abertura'
        'Fechamento')
      TabOrder = 0
      Values.Strings = (
        'A'
        'F')
    end
    object memTexto: TDBMemo
      Left = 24
      Top = 72
      Width = 505
      Height = 177
      DataField = 'TEXTO'
      DataSource = ds
      MaxLength = 1000
      TabOrder = 1
    end
  end
  inherited Dock972: TDock97
    Width = 549
  end
  inherited Dock971: TDock97
    Top = 318
    Width = 549
    inherited tb97Fundo: TToolbar97
      Left = 367
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 50064
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 778
    Top = 65527
    TargetsData = (
      1
      1
      (
        'TDBMemo'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 254
    Top = 7
  end
  inherited ImlPadrao: TImageList
    Left = 760
    Top = 65527
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 360
    Top = 7
  end
  inherited Cds: TCMClientDataSet
    Left = 204
    Top = 7
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      
        'DECODE(TERMOINVENTARIO.FLGABREFECHA,'#39'A'#39','#39'TERMO DE ABERTURA'#39','#39'TER' +
        'MO DE FECHAMENTO'#39')')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Aberto/Fechado')
    Tabelas.Strings = (
      'TERMOINVENTARIO')
    CamposChave.Strings = (
      'TERMOINVENTARIO.IDPESSOA'
      'TERMOINVENTARIO.FLGABREFECHA')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '30')
    Left = 432
    Top = 7
  end
end
