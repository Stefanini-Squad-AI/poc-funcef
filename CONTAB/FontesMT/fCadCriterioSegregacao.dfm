inherited frmCadCriterioSegregacao: TfrmCadCriterioSegregacao
  Left = 251
  Top = 212
  HelpContext = 10133
  Caption = 'Cadastro de Critérios para Segregação'
  ClientHeight = 267
  ClientWidth = 559
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 559
    Height = 181
    inherited dbGrd: TwwDBGrid [0]
      Width = 557
      Height = 179
      Selected.Strings = (
        'DESCRICAO'#9'33'#9'Descrição'
        'FLGTIPOSEGREGA'#9'13'#9'Tipo Segregação'
        'FLGTIPOCOTACAO'#9'10'#9'Tipo Cálculo'
        'TIPDESCRICAO'#9'25'#9'Tipo de Operação')
    end
    inherited pnlControles: TPanel [1]
      Width = 557
      Height = 179
      object Label1: TLabel
        Left = 24
        Top = 16
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object Label10: TLabel
        Left = 22
        Top = 86
        Width = 103
        Height = 13
        Caption = 'Tipo de Operação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edtDescricao: TwwDBEdit
        Left = 24
        Top = 32
        Width = 280
        Height = 21
        DataField = 'DESCRICAO'
        DataSource = ds
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object rdgTipoSegrega: TDBRadioGroup
        Left = 326
        Top = 12
        Width = 217
        Height = 41
        Caption = 'Tipo Segregação'
        Columns = 2
        DataField = 'FLGTIPOSEGREGA'
        DataSource = ds
        Items.Strings = (
          '&Administrativo'
          '&Investimento')
        TabOrder = 2
        Values.Strings = (
          'A'
          'I')
      end
      object rdgTipoCotacao: TDBRadioGroup
        Left = 326
        Top = 81
        Width = 216
        Height = 41
        Caption = 'Tipo Cálculo'
        Columns = 2
        DataField = 'FLGTIPOCOTACAO'
        DataSource = ds
        Items.Strings = (
          '&Percentual'
          '&Cota')
        TabOrder = 3
        Values.Strings = (
          'P'
          'C')
      end
      object dblkTipoOper: TwwDBLookupCombo
        Left = 24
        Top = 100
        Width = 281
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        DropDownAlignment = taRightJustify
        Selected.Strings = (
          'TIPDESCRICAO'#9'25'#9'TIPDESCRICAO')
        DataField = 'TIPCODIGO'
        DataSource = ds
        LookupTable = CdsTipoOper
        LookupField = 'TIPCODIGO'
        ParentFont = False
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
      end
    end
  end
  inherited Dock972: TDock97
    Width = 559
    inherited Toolbar971: TToolbar97
      inherited sbtnProcurar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 228
    Width = 559
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  inherited CmeCadastro: TCmEventosCadastro
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyEdit = CmeCadastroApplyInsert
    ApplyDelete = CmeCadastroApplyDelete
  end
  inherited Cds: TCMClientDataSet
    Active = True
    Left = 280
    Data = {
      230200009619E0BD01000000180000000A000100000003000000D0010F494453
      45475245474143524954455208000400000000000944455343524943414F0100
      490000000100055749445448020002003C00054F5244454D0800040000000000
      0E464C475449504F534547524547410100490000000200075355425459504502
      0049000A00466978656443686172000557494454480200020001000E464C4754
      49504F434F544143414F01004900000002000753554254595045020049000A00
      466978656443686172000557494454480200020001000A484954434F44484953
      5401004900000002000753554254595045020049000A00466978656443686172
      00055749445448020002000400084944504553534F4108000400000000000954
      4950434F4449474F01004900000002000753554254595045020049000A004669
      78656443686172000557494454480200020002000B544950434F4449474F5F31
      01004900000002000753554254595045020049000A0046697865644368617200
      0557494454480200020002000C54495044455343524943414F01004900000001
      0005574944544802000200190002000D44454641554C545F4F52444552020082
      00010000000200044C4349440400010016080000000000000000000000001C40
      153030352D534547522E5244412E564152494156454C00000000000014400149
      01500431303030000000000000F03F0239390239391152617465696F20496E76
      6573742F41646D}
    object CdsDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 33
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object CdsFLGTIPOSEGREGA: TStringField
      DisplayLabel = 'Tipo Segregação'
      DisplayWidth = 13
      FieldName = 'FLGTIPOSEGREGA'
      FixedChar = True
      Size = 1
    end
    object CdsFLGTIPOCOTACAO: TStringField
      DisplayLabel = 'Tipo Cálculo'
      DisplayWidth = 10
      FieldName = 'FLGTIPOCOTACAO'
      FixedChar = True
      Size = 1
    end
    object CdsTIPDESCRICAO: TStringField
      DisplayLabel = 'Tipo de Operação'
      DisplayWidth = 25
      FieldName = 'TIPDESCRICAO'
      Size = 25
    end
    object CdsTIPCODIGO: TStringField
      DisplayLabel = 'Tipo de Operação'
      DisplayWidth = 2
      FieldName = 'TIPCODIGO'
      Visible = False
      FixedChar = True
      Size = 2
    end
    object CdsORDEM: TFloatField
      DisplayLabel = 'Ordem'
      DisplayWidth = 10
      FieldName = 'ORDEM'
      Visible = False
    end
    object CdsIDSEGREGACRITER: TFloatField
      FieldName = 'IDSEGREGACRITER'
      Visible = False
    end
    object CdsHITCODHIST: TStringField
      DisplayWidth = 4
      FieldName = 'HITCODHIST'
      Visible = False
      FixedChar = True
      Size = 4
    end
    object CdsIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Visible = False
    end
    object CdsTIPCODIGO_1: TStringField
      FieldName = 'TIPCODIGO_1'
      Visible = False
      FixedChar = True
      Size = 2
    end
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'SEGREGACRITER.DESCRICAO'
      'SEGREGACRITER.ORDEM'
      'SEGREGACRITER.FLGTIPOSEGREGA'
      'SEGREGACRITER.FLGTIPOCOTACAO')
    TipodeDado.Strings = (
      'C'
      'N'
      'C'
      'C')
    Descricao.Strings = (
      ''
      ''
      ''
      '')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'SEGREGACRITER')
    CamposChave.Strings = (
      'SEGREGACRITER.IDSEGREGACRITER')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '60'
      '10'
      '1'
      '1')
  end
  object CdsTipoOper: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 170
    Top = 144
  end
end
