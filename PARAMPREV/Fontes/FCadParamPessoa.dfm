inherited frmCadParamPessoa: TfrmCadParamPessoa
  Left = 392
  Top = 29
  HelpContext = 160177
  Caption = 'Cadastro de Parâmetros de Pessoas'
  ClientHeight = 510
  ClientWidth = 539
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 539
    Height = 424
    inherited dbGrd: TwwDBGrid [0]
      Width = 537
      Height = 422
      Selected.Strings = (
        'IDPARAM'#9'10'#9'Código'
        'DESCRICAO'#9'30'#9'Descrição'
        'TIPO'#9'1'#9'Tipo'
        'VALIDACAO'#9'30'#9'Validação')
    end
    inherited pnlControles: TPanel [1]
      Width = 537
      Height = 422
      object Label1: TLabel
        Left = 17
        Top = 10
        Width = 40
        Height = 13
        Caption = 'Código'
      end
      object Label2: TLabel
        Left = 120
        Top = 10
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object Label3: TLabel
        Left = 17
        Top = 55
        Width = 57
        Height = 13
        Caption = 'Validação'
      end
      object Label4: TLabel
        Left = 17
        Top = 98
        Width = 50
        Height = 13
        Caption = 'Legenda'
      end
      object Label5: TLabel
        Left = 17
        Top = 218
        Width = 61
        Height = 13
        Caption = 'Mensagem'
        Visible = False
      end
      object Label6: TLabel
        Left = 17
        Top = 290
        Width = 61
        Height = 13
        Caption = 'Mensagem'
        Visible = False
      end
      object dbrdTipo: TDBRadioGroup
        Left = 392
        Top = 12
        Width = 129
        Height = 86
        Caption = 'Tipo de Parâmetro'
        DataField = 'TIPO'
        DataSource = ds
        Items.Strings = (
          'Caracter'
          'Valor'
          'Flag')
        TabOrder = 0
        Values.Strings = (
          'C'
          'V'
          'F')
        OnChange = dbrdTipoChange
      end
      object dbedDescricao: TwwDBEdit
        Left = 119
        Top = 24
        Width = 261
        Height = 21
        DataField = 'DESCRICAO'
        DataSource = ds
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbedValida: TwwDBEdit
        Left = 17
        Top = 69
        Width = 261
        Height = 21
        DataField = 'VALIDACAO'
        DataSource = ds
        TabOrder = 2
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object memoValor: TMemo
        Left = 16
        Top = 344
        Width = 505
        Height = 65
        Color = clInfoBk
        Enabled = False
        Lines.Strings = (
          'Exemplo de expressões válidas:'
          '> 50'
          '< 30'
          'BETEWEEN 30 AND 50')
        TabOrder = 3
        Visible = False
      end
      object memoFlag: TMemo
        Left = 16
        Top = 344
        Width = 505
        Height = 65
        Color = clInfoBk
        Enabled = False
        Lines.Strings = (
          'Exemplo de expressões válidas:'
          '('#39'S'#39')'
          '('#39'S'#39', '#39'N'#39')'
          '('#39'1'#39','#39'2'#39','#39'3'#39','#39'4'#39')')
        TabOrder = 4
        Visible = False
      end
      object wwDBEdit1: TwwDBEdit
        Left = 17
        Top = 24
        Width = 89
        Height = 21
        Color = clInfoBk
        DataField = 'IDPARAM'
        DataSource = ds
        Enabled = False
        TabOrder = 5
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object DBMemo1: TDBMemo
        Left = 17
        Top = 112
        Width = 505
        Height = 67
        DataField = 'LEGENDA'
        DataSource = ds
        MaxLength = 200
        TabOrder = 6
      end
      object dbedMsgAlertaResgate: TwwDBEdit
        Left = 16
        Top = 232
        Width = 505
        Height = 21
        DataField = 'MSGALERTARRESGATE'
        DataSource = ds
        TabOrder = 7
        UnboundDataType = wwDefault
        Visible = False
        WantReturns = False
        WordWrap = False
      end
      object dbedMsgImpedePortabilidade: TwwDBEdit
        Left = 16
        Top = 304
        Width = 505
        Height = 21
        DataField = 'MSGIMPEDEPORTABILIDADE'
        DataSource = ds
        TabOrder = 8
        UnboundDataType = wwDefault
        Visible = False
        WantReturns = False
        WordWrap = False
      end
      object dbckImpedePortabilidade: TDBCheckBox
        Left = 16
        Top = 264
        Width = 161
        Height = 17
        Caption = 'Impede Portabilidade'
        DataField = 'FLGIMPEDEPORTABILIDADE'
        DataSource = ds
        TabOrder = 9
        ValueChecked = '1'
        ValueUnchecked = '0'
        OnClick = dbckImpedePortabilidadeClick
      end
      object dbckAlertaResgate: TDBCheckBox
        Left = 16
        Top = 192
        Width = 145
        Height = 17
        Caption = 'Alerta para Resgate'
        DataField = 'FLGALERTARRESGATE'
        DataSource = ds
        TabOrder = 10
        ValueChecked = '1'
        ValueUnchecked = '0'
        OnClick = dbckAlertaResgateClick
      end
    end
  end
  inherited Dock972: TDock97
    Width = 539
  end
  inherited Dock971: TDock97
    Top = 471
    Width = 539
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 488
    Top = 14
    TargetsData = (
      1
      2
      (
        'TMemo'
        'Text'
        0)
      (
        'TDBMemo'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 355
    Top = 14
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update PARAMFLAGPESSOA'
      'set'
      '  TIPO = :TIPO,'
      '  VALIDACAO = :VALIDACAO,'
      '  DESCRICAO = :DESCRICAO,'
      '  IDFUNDACAO = :IDFUNDACAO,'
      '  LEGENDA    = :LEGENDA,'
      '  FLGALERTARRESGATE = :FLGALERTARRESGATE , '
      ' MSGALERTARRESGATE = :MSGALERTARRESGATE , '
      ' FLGIMPEDEPORTABILIDADE = :FLGIMPEDEPORTABILIDADE , '
      ' MSGIMPEDEPORTABILIDADE = :MSGIMPEDEPORTABILIDADE '
      'where'
      '  IDPARAM = :OLD_IDPARAM'
      ' ')
    InsertSQL.Strings = (
      'insert into PARAMFLAGPESSOA'
      
        '  (IDPARAM, TIPO, VALIDACAO, DESCRICAO, IDFUNDACAO, LEGENDA, FLG' +
        'ALERTARRESGATE, MSGALERTARRESGATE, FLGIMPEDEPORTABILIDADE, MSGIM' +
        'PEDEPORTABILIDADE )'
      'values'
      
        '  (:IDPARAM, :TIPO, :VALIDACAO, :DESCRICAO, :IDFUNDACAO, :LEGEND' +
        'A, :FLGALERTARRESGATE, :MSGALERTARRESGATE, :FLGIMPEDEPORTABILIDA' +
        'DE, :MSGIMPEDEPORTABILIDADE )'
      ' ')
    DeleteSQL.Strings = (
      'delete from PARAMFLAGPESSOA'
      'where'
      '  IDPARAM = :OLD_IDPARAM')
    Left = 323
    Top = 14
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'PARAMFLAGPESSOA.IDPARAM'
      'PARAMFLAGPESSOA.DESCRICAO'
      'PARAMFLAGPESSOA.TIPO'
      'PARAMFLAGPESSOA.VALIDACAO')
    TipodeDado.Strings = (
      'N'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição'
      'Tipo'
      'Validação')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PARAMFLAGPESSOA')
    CamposChave.Strings = (
      'PARAMFLAGPESSOA.IDPARAM')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '30'
      '1'
      '30')
    Left = 253
    Top = 14
  end
  inherited ImlPadrao: TImageList
    Left = 449
    Top = 14
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 292
    Top = 14
  end
  inherited qry: TwwQuery
    BeforePost = qryBeforePost
    SQL.Strings = (
      'SELECT'
      '  *'
      '  '
      'FROM'
      '  PARAMFLAGPESSOA'
      ''
      'WHERE IDFUNDACAO = :IDFUNDACAO'
      '  AND IDPARAM    = :IDPARAM')
    Left = 394
    Top = 14
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPARAM'
        ParamType = ptUnknown
      end>
  end
  object qryAux: TwwQuery
    Tag = 5
    BeforePost = qryBeforePost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM PARAMFLAGPESSOA')
    ValidateWithMask = True
    Left = 498
    Top = 78
  end
end
