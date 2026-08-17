inherited frmCadastroContratoPadrao: TfrmCadastroContratoPadrao
  Left = 137
  Top = 111
  HelpContext = 150062
  Caption = 'Cadastro de Contrato Padrão'
  ClientHeight = 348
  ClientWidth = 498
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Top = 35
    Width = 498
    Height = 280
    inherited pnlMestre: TPanel
      Width = 496
      Height = 112
      object Label1: TLabel
        Left = 16
        Top = 10
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object Label2: TLabel
        Left = 16
        Top = 59
        Width = 83
        Height = 13
        Alignment = taRightJustify
        Caption = 'Data de Início'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBedtDescricao: TDBEdit
        Left = 16
        Top = 24
        Width = 393
        Height = 21
        DataField = 'CTPDESCRICAO'
        DataSource = ds
        TabOrder = 0
      end
      object edtDataInicio: TwwDBDateTimePicker
        Left = 16
        Top = 72
        Width = 105
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'CTPDATAINICIO'
        DataSource = ds
        Epoch = 1950
        ButtonWidth = 20
        ButtonGlyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          88888888888888888888800000000000000880FFFFFFFFFFFF0880F878787978
          7F0880F7878797978F0880F8787879787F0880F7878787878F0880F878787878
          7F0880F7878787878F0880FFFFFFFFFFFF0880F4C4C4C7777F0880FC4C4C4777
          7F0880FFFFFFFFFFFF0880000000000000088888888888888888}
        ShowButton = True
        TabOrder = 1
        DisplayFormat = 'dd/mm/yyyy'
      end
      object DBchkAssinatObrig: TDBCheckBox
        Left = 152
        Top = 73
        Width = 153
        Height = 17
        Caption = 'Assinatura obrigatória'
        DataField = 'CTPOBRIGATORIO'
        DataSource = ds
        TabOrder = 2
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 113
      Width = 496
      Height = 166
      inherited pgctrlDetalhe: TPageControl
        Width = 398
        Height = 107
        inherited tbsDet: TTabSheet
          inherited dbgrdDet: TwwDBGrid
            Width = 390
            Height = 79
            Selected.Strings = (
              'TCEDESCRICAO'#9'60'#9'Tipo de Contrato')
          end
          inherited pnlControlesDet: TPanel
            Width = 390
            Height = 79
            object Label4: TLabel
              Left = 16
              Top = 10
              Width = 96
              Height = 13
              Caption = 'Tipo de Contrato'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBcboTipoContrato: TwwDBLookupCombo
              Left = 16
              Top = 24
              Width = 361
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'TceDescricao'#9'80'#9'Tipo de Contrato'#9'F')
              DataField = 'IDTIPOCONTREMPTMO'
              DataSource = dsDet
              LookupTable = qryTipoContrato
              LookupField = 'IDTIPOCONTREMPTMO'
              Options = [loTitles]
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
              ShowMatchText = True
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 488
      end
      inherited Dock974: TDock97
        Left = 402
        Height = 107
        inherited tb97Detalhe: TToolbar97
          inherited bbtnOkDet: TBitBtn
            Margin = 6
          end
          inherited bbtnCancelarDet: TBitBtn
            Margin = 6
          end
          inherited bbtnVoltarDet: TBitBtn
            Margin = 6
          end
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 498
    Height = 35
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Width = 85
        Height = 29
        Layout = blGlyphLeft
        Spacing = 4
      end
      inherited sbtnAlterar: TToolbarButton97
        Left = 85
        Width = 85
        Height = 29
        Layout = blGlyphLeft
        Spacing = 4
      end
      inherited sbtnProcurar: TToolbarButton97
        Left = 255
        Width = 85
        Height = 29
        Layout = blGlyphLeft
        Spacing = 4
      end
      inherited sbtnApagar: TToolbarButton97
        Left = 170
        Width = 85
        Height = 29
        Layout = blGlyphLeft
        Spacing = 4
      end
    end
  end
  inherited Dock971: TDock97
    Top = 315
    Width = 498
    Height = 33
    inherited tb97Fundo: TToolbar97
      inherited bbtnSair: TBitBtn
        Height = 27
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Height = 27
        ClickHelpContext = 150056
      end
    end
    inherited TB97oKCancelar: TToolbar97
      inherited bbtnConfirmar: TBitBtn
        Height = 27
      end
      inherited bbtnCancelar: TBitBtn
        Height = 27
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 768
    Top = 2
  end
  inherited dsDet: TwwDataSource
    DataSet = qryDet
    Left = 328
    Top = 176
  end
  inherited ds: TwwDataSource
    Left = 376
    Top = 0
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update CONTRATOPADRAO'
      'set'
      '  IDTIPOCONTREMPTMO = :IDTIPOCONTREMPTMO,'
      '  CTPDESCRICAO = :CTPDESCRICAO,'
      '  CTPOBRIGATORIO = :CTPOBRIGATORIO,'
      '  CTPDATAINICIO = :CTPDATAINICIO'
      'where'
      '  IDCONTRATOPADRAO = :OLD_IDCONTRATOPADRAO')
    InsertSQL.Strings = (
      'insert into CONTRATOPADRAO'
      '  (IDCONTRATOPADRAO, IDTIPOCONTREMPTMO, CTPDESCRICAO, '
      'CTPOBRIGATORIO, CTPDATAINICIO)'
      'values'
      '  (:IDCONTRATOPADRAO, :IDTIPOCONTREMPTMO, :CTPDESCRICAO, '
      ':CTPOBRIGATORIO, '
      '   :CTPDATAINICIO)')
    DeleteSQL.Strings = (
      'delete from CONTRATOPADRAO'
      'where'
      '  IDCONTRATOPADRAO = :OLD_IDCONTRATOPADRAO')
    Left = 408
    Top = 0
  end
  inherited MontaSelect: TMontaSelect
    Caption = ''
    Colunas.Strings = (
      'CTP.CTPDESCRICAO'
      'CTP.CTPDATAINICIO')
    TipodeDado.Strings = (
      'C'
      'D')
    Descricao.Strings = (
      'Descrição do Contrato Padrão'
      'Data de Início')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'CONTRATOPADRAO CTP')
    CamposChave.Strings = (
      'CTP.IDCONTRATOPADRAO')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '60'
      '18')
    Left = 451
    Top = 26
  end
  inherited ImlPadrao: TImageList
    Left = 769
    Top = 50
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 452
    Top = 74
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '   CTP.IDCONTRATOPADRAO,'
      '   CTP.IDTIPOCONTREMPTMO,'
      '   CTP.CTPDESCRICAO,'
      '   CTP.CTPOBRIGATORIO,'
      '   CTP.CTPDATAINICIO'
      ''
      'FROM'
      '   CONTRATOPADRAO CTP'
      ''
      'WHERE'
      '   CTP.IDCONTRATOPADRAO =:PIDCONTRATOPADRAO')
    Left = 344
    Top = 0
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOPADRAO'
        ParamType = ptInput
      end>
    object qryIDCONTRATOPADRAO: TFloatField
      FieldName = 'IDCONTRATOPADRAO'
      Origin = 'BASEDADOS.CONTRATOPADRAO.IDCONTRATOPADRAO'
    end
    object qryIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
      Origin = 'BASEDADOS.CONTRATOPADRAO.IDTIPOCONTREMPTMO'
    end
    object qryCTPDESCRICAO: TStringField
      FieldName = 'CTPDESCRICAO'
      Origin = 'BASEDADOS.CONTRATOPADRAO.CTPDESCRICAO'
      Size = 60
    end
    object qryCTPOBRIGATORIO: TFloatField
      FieldName = 'CTPOBRIGATORIO'
      Origin = 'BASEDADOS.CONTRATOPADRAO.CTPOBRIGATORIO'
    end
    object qryCTPDATAINICIO: TDateTimeField
      FieldName = 'CTPDATAINICIO'
      Origin = 'BASEDADOS.CONTRATOPADRAO.CTPDATAINICIO'
    end
  end
  inherited CmeDetalhe: TCmEventosCadastro
    BeforeConfirma = CmeDetalheBeforeConfirma
    Left = 452
    Top = 122
  end
  object qryTipoContrato: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   TIP.IDTIPOCONTREMPTMO, TIP.IDTIPOEMPTMO, TIP.TCEDESCRICAO,'
      '   TEM.DESCTIPOEMPTMO'
      'FROM'
      '   TIPOCONTREMPTMO  TIP,'
      '   TIPOEMPTMO TEM'
      'WHERE'
      '   ( TIP.IDTIPOEMPTMO = TEM.IDTIPOEMPTMO )'
      '   AND ( TEM.IDEMPRESAPROP =:PIDEMPRESAPROP )')
    ValidateWithMask = True
    Left = 208
    Top = 240
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDEMPRESAPROP'
        ParamType = ptInput
      end>
    object qryTipoContratoTCEDESCRICAO: TStringField
      DisplayLabel = 'Tipo de Contrato'
      DisplayWidth = 80
      FieldName = 'TCEDESCRICAO'
      Origin = 'BASEDADOS."CM.TIPOCONTREMPTMO".TCEDESCRICAO'
      Size = 60
    end
    object qryTipoContratoIDTIPOEMPTMO: TFloatField
      FieldName = 'IDTIPOEMPTMO'
      Origin = 'BASEDADOS.TIPOCONTREMPTMO.IDTIPOEMPTMO'
      Visible = False
    end
    object qryTipoContratoDESCTIPOEMPTMO: TStringField
      DisplayLabel = 'Tipo de Empréstimo'
      DisplayWidth = 32
      FieldName = 'DESCTIPOEMPTMO'
      Origin = 'BASEDADOS.TIPOEMPTMO.DESCTIPOEMPTMO'
      Visible = False
      Size = 60
    end
    object qryTipoContratoIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
      Origin = 'BASEDADOS."CM.TIPOCONTREMPTMO".IDTIPOCONTREMPTMO'
      Visible = False
    end
  end
  object qryDet: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   CPA.IDCONTRATOPADRAO,'
      '   CPA.IDTIPOCONTREMPTMO,'
      '   TCE.TCEDESCRICAO'
      'FROM'
      '   CONTRPADRXTIPOCONTR CPA,'
      '   TIPOCONTREMPTMO     TCE'
      'WHERE'
      '       CPA.IDCONTRATOPADRAO   =:PIDCONTRATOPADRAO'
      '   AND CPA.IDTIPOCONTREMPTMO  = TCE.IDTIPOCONTREMPTMO'
      'ORDER BY'
      '   TCE.TCEDESCRICAO')
    UpdateObject = updDet
    ValidateWithMask = True
    Left = 288
    Top = 176
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOPADRAO'
        ParamType = ptInput
      end>
    object qryDetIDCONTRATOPADRAO: TFloatField
      FieldName = 'IDCONTRATOPADRAO'
      Origin = 'BASEDADOS.CONTRPADRXTIPOCONTR.IDCONTRATOPADRAO'
    end
    object qryDetIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
      Origin = 'BASEDADOS.CONTRPADRXTIPOCONTR.IDTIPOCONTREMPTMO'
    end
    object qryDetTCEDESCRICAO: TStringField
      FieldName = 'TCEDESCRICAO'
      Origin = 'BASEDADOS.TIPOCONTREMPTMO.TCEDESCRICAO'
      Size = 60
    end
  end
  object updDet: TUpdateSQL
    ModifySQL.Strings = (
      'update CONTRPADRXTIPOCONTR'
      'set'
      '  IDCONTRATOPADRAO = :IDCONTRATOPADRAO,'
      '  IDTIPOCONTREMPTMO = :IDTIPOCONTREMPTMO'
      'where'
      '  IDCONTRATOPADRAO = :OLD_IDCONTRATOPADRAO and'
      '  IDTIPOCONTREMPTMO = :OLD_IDTIPOCONTREMPTMO')
    InsertSQL.Strings = (
      'insert into CONTRPADRXTIPOCONTR'
      '  (IDCONTRATOPADRAO, IDTIPOCONTREMPTMO)'
      'values'
      '  (:IDCONTRATOPADRAO, :IDTIPOCONTREMPTMO)')
    DeleteSQL.Strings = (
      'delete from CONTRPADRXTIPOCONTR'
      'where'
      '  IDCONTRATOPADRAO = :OLD_IDCONTRATOPADRAO and'
      '  IDTIPOCONTREMPTMO = :OLD_IDTIPOCONTREMPTMO')
    Left = 368
    Top = 176
  end
end
