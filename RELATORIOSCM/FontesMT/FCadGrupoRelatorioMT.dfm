inherited FrmCadGrupoRelatorio: TFrmCadGrupoRelatorio
  Left = 336
  Top = 231
  Caption = 'Grupo de Relatórios'
  ClientHeight = 219
  ClientWidth = 483
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 483
    Height = 133
    object Label1: TLabel
      Left = 16
      Top = 44
      Width = 58
      Height = 13
      Caption = 'Descrição'
      FocusControl = DbEdGrupo
    end
    object sbtnGrupoMestre: TSpeedButton
      Left = 442
      Top = 100
      Width = 23
      Height = 22
      Glyph.Data = {
        4E010000424D4E01000000000000760000002800000014000000120000000100
        040000000000D800000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777BBBBBBBBB
        BBBBB777000077BBBBBBBBBBBBBBBB7700007BBB777777777777BBB700007BB8
        8000000000008BB700007BB77777777777777BB700007BBB878787870087BBB7
        000077BBBBBBB00BB0BBBB770000777BBBB003B338BBB77700007777770FFF33
        0777777700007787808FFFF308787877000077770378FFF07777777700007780
        37338FF078787877000077037333380777777777000070373333807878787877
        0000737333380777777777770000773333807878787878770000733338077777
        777777770000733380787878787878770000}
      OnClick = sbtnGrupoMestreClick
    end
    object lblGrupoMestre: TLabel
      Left = 16
      Top = 85
      Width = 77
      Height = 13
      Caption = 'Grupo Mestre'
    end
    object DbEdGrupo: TwwDBEdit
      Left = 16
      Top = 60
      Width = 449
      Height = 21
      DataField = 'DESCRICAO'
      DataSource = ds
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object edtGrpMestre: TEdit
      Left = 16
      Top = 101
      Width = 424
      Height = 21
      ReadOnly = True
      TabOrder = 1
    end
  end
  inherited Dock972: TDock97
    Width = 483
  end
  inherited Dock971: TDock97
    Top = 180
    Width = 483
    inherited tb97Fundo: TToolbar97
      Left = 311
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 142
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 318
    Top = 55
  end
  inherited ds: TwwDataSource
    Left = 382
    Top = 7
  end
  inherited ImlPadrao: TImageList
    Left = 316
    Top = 7
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 436
    Top = 7
  end
  inherited Cds: TCMClientDataSet
    Left = 380
    Top = 55
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'GRUPORELATORIO.DESCRICAO')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Descrição')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'GRUPORELATORIO')
    CamposChave.Strings = (
      'GRUPORELATORIO.IDGRUPORELATORIO'
      'GRUPORELATORIO.ORIGEMCMGR'
      'GRUPORELATORIO.IDGRUPOMESTRE')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
    OperComparador.Strings = (
      '-1')
    LookupSQL.Strings = (
      '')
    LookupCampoChave.Strings = (
      '')
    LookupCampoExibe.Strings = (
      '')
    Left = 436
    Top = 55
  end
end
