inherited frmCadSitFunc: TfrmCadSitFunc
  Left = 175
  Top = 152
  HelpContext = 160169
  Caption = 'Cadastro da Situação do Empregado na Patrocinadora'
  ClientHeight = 221
  ClientWidth = 508
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 508
    Height = 135
    object Label3: TLabel
      Left = 18
      Top = 19
      Width = 58
      Height = 13
      Caption = 'Descrição'
    end
    object Label1: TLabel
      Left = 414
      Top = 18
      Width = 40
      Height = 13
      Caption = 'Código'
    end
    object Label4: TLabel
      Left = 18
      Top = 75
      Width = 139
      Height = 13
      Caption = 'Situação do Funcionário'
    end
    object dbedDescricao: TwwDBEdit
      Left = 18
      Top = 33
      Width = 391
      Height = 21
      DataField = 'DESCRICAO'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbedCodigo: TDBEdit
      Left = 414
      Top = 33
      Width = 67
      Height = 21
      Color = clSilver
      DataField = 'IDSITFUNC'
      DataSource = ds
      Enabled = False
      ReadOnly = True
      TabOrder = 1
    end
    object cbFlgInterno: TComboBox
      Left = 18
      Top = 89
      Width = 231
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 13
      ParentFont = False
      TabOrder = 2
      Items.Strings = (
        'Ativo'
        'Demitido'
        'Demitido Aposentado'
        'Afastado sem Remuneração'
        'Afastado com Remuneração'
        'Falecido Natural'
        'Falecido Acidental'
        'Demitido por PID'
        'Demitido por PIA'
        ' ')
    end
    object dbrdgrpTipoUso: TDBRadioGroup
      Left = 256
      Top = 69
      Width = 225
      Height = 41
      Caption = 'Tipo de Uso'
      Columns = 2
      DataField = 'FLGUSO'
      DataSource = ds
      Items.Strings = (
        'Geral'
        'Previdenciário')
      TabOrder = 3
      Values.Strings = (
        'G'
        'P'
        '')
    end
  end
  inherited Dock972: TDock97
    Width = 508
  end
  inherited Dock971: TDock97
    Top = 182
    Width = 508
    inherited tb97Fundo: TToolbar97
      Left = 327
      DockPos = 327
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 158
      DockPos = 158
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 65499
    Top = 65499
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 336
    Top = 2
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update SITFUNC'
      'set'
      '  IDSITFUNC = :IDSITFUNC,'
      '  DESCRICAO = :DESCRICAO,'
      '  TIPOSIT = :TIPOSIT,'
      '  FLGINTERNO = :FLGINTERNO,'
      '  CODCAGED = :CODCAGED,'
      '  CODMOVFGTS = :CODMOVFGTS,'
      '  FLGUSO = :FLGUSO'
      'where'
      '  IDSITFUNC = :OLD_IDSITFUNC')
    InsertSQL.Strings = (
      'insert into SITFUNC'
      
        '  (IDSITFUNC, DESCRICAO, TIPOSIT, FLGINTERNO, CODCAGED, CODMOVFG' +
        'TS, '
      'FLGUSO)'
      'values'
      '  (:IDSITFUNC, :DESCRICAO, :TIPOSIT, :FLGINTERNO, :CODCAGED, '
      ':CODMOVFGTS, '
      '   :FLGUSO)')
    DeleteSQL.Strings = (
      'delete from SITFUNC'
      'where'
      '  IDSITFUNC = :OLD_IDSITFUNC')
    Left = 255
    Top = 65535
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'SITFUNC.IDSITFUNC'
      'SITFUNC.DESCRICAO')
    TipodeDado.Strings = (
      'N'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'SITFUNC')
    CamposChave.Strings = (
      'SITFUNC.IDSITFUNC')
    Filtro.Strings = (
      '(SITFUNC.FLGUSO = '#39'P'#39'  OR SITFUNC.FLGUSO = '#39'G'#39') ')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '35')
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 358
    Top = 58
  end
  inherited qry: TwwQuery
    Tag = 5
    BeforePost = qryBeforePost
    SQL.Strings = (
      'SELECT  SIT.IDSITFUNC, '
      '                SIT.DESCRICAO, '
      '                SIT.TIPOSIT, '
      '                SIT.FLGINTERNO, '
      '                SIT.CODCAGED, '
      '                SIT.CODMOVFGTS, '
      #9'SIT.FLGUSO'
      'FROM SITFUNC SIT'
      'WHERE SIT.IDSITFUNC = :IDSITFUNC')
    Left = 297
    Top = 14
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDSITFUNC'
        ParamType = ptUnknown
      end>
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 440
    Top = 9
  end
end
