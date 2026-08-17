inherited frmLerSalarios: TfrmLerSalarios
  Left = 310
  Top = 177
  Caption = 'Informe do Salário de Participação do Mês'
  ClientHeight = 345
  ClientWidth = 745
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 745
    Height = 306
    object lblPlano: TLabel
      Left = 12
      Top = 11
      Width = 5
      Height = 16
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblPatro: TLabel
      Left = 12
      Top = 33
      Width = 5
      Height = 16
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object wwDBGrid1: TwwDBGrid
      Left = 8
      Top = 56
      Width = 729
      Height = 242
      Selected.Strings = (
        'MATRICULA'#9'8'#9'Matrícula'
        'NOME'#9'40'#9'Participante'
        'INSCRICAONUMERO'#9'6'#9'Inscrição'
        'SALARIO'#9'10'#9'Salário Folha Mês'
        'SALPARTICIPACAO'#9'10'#9'Salário Ativo'
        'SALMANTIDO'#9'10'#9'Salário Mantido'
        'NOME_1'#9'50'#9'Plano Previdênciário')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
      DataSource = dsPartSql
      EditCalculated = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      KeyOptions = []
      ParentFont = False
      TabOrder = 0
      TitleAlignment = taCenter
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      IndicatorColor = icBlack
    end
    object bbtnProcurar: TBitBtn
      Left = 645
      Top = 14
      Width = 91
      Height = 37
      Hint = 'Procurar '
      Caption = '&Procurar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = bbtnProcurarClick
      Glyph.Data = {
        4E010000424D4E01000000000000760000002800000012000000120000000100
        040000000000D800000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDDD000000DDDDDDDDDDDDDDDDDD000000D000000000000DD00D000000D0FF
        FFFFFFFF0D000D000000D0FFFFFFF0000800DD000000D0FFFFFF0877808DDD00
        0000D0FFFFF0877E880DDD000000D0FFFFF07777870DDD000000D0FFFFF07E77
        870DDD000000D0FFFFF08EE7880DDD000000D0FFFFFF087780DDDD000000D0FF
        FFFFF0000DDDDD000000D0FFFFFFFFFF0DDDDD000000D0FFFFFFF0000DDDDD00
        0000D0FFFFFFF070DDDDDD000000D0FFFFFFF00DDDDDDD000000DD00000000DD
        DDDDDD000000DDDDDDDDDDDDDDDDDD000000}
    end
  end
  inherited Dock971: TDock97
    Top = 306
    Width = 745
    inherited tb97Fundo: TToolbar97
      Left = 573
      DockPos = 576
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 404
      DockPos = 407
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 487
    Top = 1
  end
  object dsPartSql: TwwDataSource
    DataSet = qryPartSalGeral
    Left = 496
    Top = 220
  end
  object qryPartSalGeral: TwwQuery
    CachedUpdates = True
    OnCalcFields = qryPartSalGeralCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  PAR.INSCRICAONUMERO,  EL.MATRICULA, P.NOME,  '
      '                PL.NOME,  PAR.SALPARTICIPACAO  AS SALARIO,  '
      '                PAR.SALMANTIDO, '
      
        '                PAR.SALPARTICIPACAO,  PAR.IDPESSJUR, PAR.IDPLANO' +
        'PREV,'
      '                PAR.IDPESSOA,  PAR.SEQPROPOSTA'
      'FROM      PLANPREV PL,  PARTPREVPLAN  PAR, PESSOA  P, '
      '                SITPART ST,      ELEGPATRO  EL'
      'WHERE   ST.FLGINTERNO   = '#39'MP'#39
      'AND    PAR.IDSITPART         = ST.IDSITPART'
      'AND    PAR.IDPLANOPREV   = PL.IDPLANOPREV'
      'AND    PAR.IDPESSOA          = P.IDPESSOA'
      'AND    PAR.IDPESSJUR        = EL.IDPESSJUR'
      'AND    PAR.IDPESSOA           = EL.IDPESSOA'
      'ORDER   BY  P.NOME'
      ''
      ''
      ''
      ' ')
    UpdateObject = updPartSalGeral
    ValidateWithMask = True
    Left = 568
    Top = 219
    object qryPartSalGeralMATRICULA: TStringField
      DisplayLabel = 'Matrícula'
      DisplayWidth = 8
      FieldName = 'MATRICULA'
      Size = 13
    end
    object qryPartSalGeralNOME: TStringField
      DisplayLabel = 'Participante'
      DisplayWidth = 40
      FieldName = 'NOME'
      Size = 60
    end
    object qryPartSalGeralINSCRICAONUMERO: TFloatField
      DisplayLabel = 'Inscrição'
      DisplayWidth = 6
      FieldName = 'INSCRICAONUMERO'
    end
    object qryPartSalGeralSALARIO: TFloatField
      DisplayLabel = 'Salário Folha Mês'
      DisplayWidth = 10
      FieldName = 'SALARIO'
      currency = True
    end
    object qryPartSalGeralSALPARTICIPACAO: TFloatField
      DisplayLabel = 'Salário Ativo'
      DisplayWidth = 10
      FieldName = 'SALPARTICIPACAO'
      currency = True
    end
    object qryPartSalGeralSALMANTIDO: TFloatField
      DisplayLabel = 'Salário Mantido'
      DisplayWidth = 10
      FieldName = 'SALMANTIDO'
      currency = True
    end
    object qryPartSalGeralNOME_1: TStringField
      DisplayLabel = 'Plano Previdênciário'
      DisplayWidth = 50
      FieldName = 'NOME_1'
      Size = 50
    end
    object qryPartSalGeralIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
      Visible = False
    end
    object qryPartSalGeralIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Visible = False
    end
    object qryPartSalGeralIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Visible = False
    end
    object qryPartSalGeralSEQPROPOSTA: TFloatField
      FieldName = 'SEQPROPOSTA'
      Visible = False
    end
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 498
    Top = 165
  end
  object MontaSelectPart: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'ELEGPATRO.MATRICULA'
      'PARTICIPANTE.NOME'
      'PARTPREVPLAN.INSCRICAONUMERO'
      'PLANPREV.NOME'
      'PATROCINADORA.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'N'
      'N')
    Descricao.Strings = (
      'Matrícula'
      'Participante'
      'Número de Inscrição'
      'Plano'
      'Patrocinadora')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA PARTICIPANTE'
      'PESSOA PATROCINADORA'
      'PLANPREV'
      'ELEGPATRO'
      'PARTPREVPLAN')
    CamposChave.Strings = (
      'PARTICIPANTE.NOME'
      'PLANPREV.NOME'
      'PATROCINADORA.NOME'
      'PARTPREVPLAN.IDPESSOA'
      'PARTPREVPLAN.IDPESSJUR'
      'PARTPREVPLAN.IDPLANOPREV')
    Filtro.Strings = (
      'PARTPREVPLAN.IDPESSOA = PARTICIPANTE.IDPESSOA'
      'PARTPREVPLAN.IDPLANOPREV = PLANPREV.IDPLANOPREV'
      'PARTPREVPLAN.IDPESSJUR = PATROCINADORA.IDPESSOA'
      'PARTPREVPLAN.IDPESSJUR = ELEGPATRO.IDPESSJUR'
      'PARTPREVPLAN.IDPESSOA = ELEGPATRO.IDPESSOA'
      'PARTPREVPLAN.FLGDESATIVADO = 0')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '10'
      '10'
      '10'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 398
    Top = 7
  end
  object updPartSalGeral: TUpdateSQL
    ModifySQL.Strings = (
      'update PARTPREVPLAN'
      'set'
      '  SALMANTIDO = :SALMANTIDO,'
      '  SALPARTICIPACAO = :SALPARTICIPACAO'
      'where'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  SEQPROPOSTA = :OLD_SEQPROPOSTA')
    InsertSQL.Strings = (
      'insert into PARTPREVPLAN'
      '  (SALMANTIDO, SALPARTICIPACAO)'
      'values'
      '  (:SALMANTIDO, :SALPARTICIPACAO)')
    DeleteSQL.Strings = (
      'delete from PARTPREVPLAN'
      'where'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  SEQPROPOSTA = :OLD_SEQPROPOSTA')
    Left = 646
    Top = 219
  end
  object qryPartSal: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT  PAR.INSCRICAONUMERO,  EL.MATRICULA, P.NOME,  PL.NOME,  0' +
        '  AS SALARIO,  PAR.SALMANTIDO, '
      
        '               PAR.SALPARTICIPACAO, PAR.IDPESSJUR, PAR.IDPLANOPR' +
        'EV,'
      '               PAR.IDPESSOA,  PAR.SEQPROPOSTA'
      'FROM     PLANPREV PL, PARTPREVPLAN PAR, PESSOA P, '
      '               SITPART ST,  ELEGPATRO EL'
      'WHERE  PAR.IDPESSJUR IN  (:IDPESSJUR) '
      'AND    ST.FLGINTERNO        = '#39'MP'#39
      'AND    PAR.IDSITPART         = ST.IDSITPART'
      'AND    PAR.IDPLANOPREV   = PL.IDPLANOPREV'
      'AND    PAR.IDPESSOA          = P.IDPESSOA'
      'AND    PAR.IDPESSJUR        = EL.IDPESSJUR'
      'AND    PAR.IDPESSOA          = EL.IDPESSOA'
      'ORDER   BY  P.NOME'
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 568
    Top = 163
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end>
    object StringField1: TStringField
      DisplayLabel = 'Matrícula'
      DisplayWidth = 8
      FieldName = 'MATRICULA'
      Size = 13
    end
    object StringField2: TStringField
      DisplayLabel = 'Participante'
      DisplayWidth = 49
      FieldName = 'NOME'
      Size = 60
    end
    object FloatField1: TFloatField
      DisplayLabel = 'Inscrição'
      DisplayWidth = 6
      FieldName = 'INSCRICAONUMERO'
    end
    object FloatField2: TFloatField
      DisplayLabel = '  Salário'
      DisplayWidth = 10
      FieldName = 'SALARIO'
      currency = True
    end
    object StringField3: TStringField
      DisplayLabel = 'Plano Previdênciário'
      DisplayWidth = 50
      FieldName = 'NOME_1'
      Size = 50
    end
    object FloatField3: TFloatField
      DisplayLabel = 'Salário Mantido'
      DisplayWidth = 10
      FieldName = 'SALMANTIDO'
      currency = True
    end
    object FloatField4: TFloatField
      DisplayLabel = 'Último Salário'
      DisplayWidth = 10
      FieldName = 'SALPARTICIPACAO'
      currency = True
    end
    object FloatField5: TFloatField
      FieldName = 'IDPESSJUR'
      Visible = False
    end
    object FloatField6: TFloatField
      FieldName = 'IDPLANOPREV'
      Visible = False
    end
    object FloatField7: TFloatField
      FieldName = 'IDPESSOA'
      Visible = False
    end
    object FloatField8: TFloatField
      FieldName = 'SEQPROPOSTA'
      Visible = False
    end
  end
  object updPartSal: TUpdateSQL
    ModifySQL.Strings = (
      'update PARTPREVPLAN'
      'set'
      '  SALMANTIDO = :SALMANTIDO,'
      '  SALPARTICIPACAO = :SALPARTICIPACAO'
      'where'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  SEQPROPOSTA = :OLD_SEQPROPOSTA')
    InsertSQL.Strings = (
      'insert into PARTPREVPLAN'
      '  (SALMANTIDO, SALPARTICIPACAO)'
      'values'
      '  (:SALMANTIDO, :SALPARTICIPACAO)')
    DeleteSQL.Strings = (
      'delete from PARTPREVPLAN'
      'where'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  SEQPROPOSTA = :OLD_SEQPROPOSTA')
    Left = 640
    Top = 163
  end
end
