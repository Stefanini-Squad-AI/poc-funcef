inherited FrmImportaCotacoesFundos: TFrmImportaCotacoesFundos
  Left = 159
  Top = 44
  HelpContext = 790200
  Caption = ''
  ClientHeight = 307
  ClientWidth = 366
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 366
    Height = 268
    inherited bvlSepTit: TBevel
      Width = 364
    end
    object Label3: TLabel [1]
      Left = 13
      Top = 12
      Width = 111
      Height = 13
      Caption = 'Data do Movimento'
    end
    object lblArquivo: TLabel [2]
      Left = 21
      Top = 58
      Width = 195
      Height = 13
      Caption = 'Indique o caminho para o arquivo '
    end
    object SB1: TSpeedButton [3]
      Left = 321
      Top = 74
      Width = 22
      Height = 21
      Hint = 'Buscar Arquivo '
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
      ParentShowHint = False
      ShowHint = True
      OnClick = SB1Click
    end
    object Label14: TLabel [4]
      Left = 22
      Top = 110
      Width = 116
      Height = 13
      Caption = '1a. Linha de Dados:'
    end
    object lblNomFdo: TLabel [5]
      Left = 22
      Top = 199
      Width = 94
      Height = 13
      Caption = 'Nome do Fundo:'
    end
    object lblData: TLabel [6]
      Left = 151
      Top = 199
      Width = 32
      Height = 13
      Caption = 'Data:'
    end
    object lblCota: TLabel [7]
      Left = 217
      Top = 199
      Width = 31
      Height = 13
      Caption = 'Cota:'
    end
    object lblCNPJ: TLabel [8]
      Left = 284
      Top = 199
      Width = 36
      Height = 13
      Caption = 'CNPJ:'
    end
    object Bevel1: TBevel [9]
      Left = 21
      Top = 186
      Width = 320
      Height = 2
    end
    object Label1: TLabel [10]
      Left = 22
      Top = 169
      Width = 190
      Height = 13
      Caption = 'Colunas Utilizadas na Importação'
    end
    object lblNomPlanilha: TLabel [11]
      Left = 22
      Top = 137
      Width = 100
      Height = 13
      Caption = 'Nome da Planilha'
    end
    inherited pnlTitulo: TPanel
      Width = 364
      inherited lbNomDescricao: TfcLabel
        Width = 324
        Caption = 'Importação de Cotas de Fundos'
      end
    end
    object edtArquivo: TEdit
      Left = 21
      Top = 74
      Width = 300
      Height = 21
      TabOrder = 1
    end
    object edtLinha: TEdit
      Left = 145
      Top = 105
      Width = 45
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 2
      Text = '6'
    end
    object edtNomFdo: TEdit
      Left = 119
      Top = 194
      Width = 17
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 2
      TabOrder = 3
      Text = 'B'
    end
    object edtData: TEdit
      Left = 186
      Top = 194
      Width = 17
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 2
      TabOrder = 4
      Text = 'E'
    end
    object edtCota: TEdit
      Left = 251
      Top = 194
      Width = 17
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 2
      TabOrder = 5
      Text = 'D'
    end
    object edtCNPJ: TEdit
      Left = 323
      Top = 194
      Width = 17
      Height = 21
      CharCase = ecUpperCase
      MaxLength = 2
      TabOrder = 6
      Text = 'C'
    end
    object edtNomPlanilha: TEdit
      Left = 145
      Top = 132
      Width = 192
      Height = 21
      TabOrder = 7
      Text = 'Novo Layout'
    end
    inline fraMensProc: TfraMensagem
      Left = 1
      Top = 235
      Width = 364
      Align = alBottom
      TabOrder = 8
      inherited pnlProgresso: TPanel
        Width = 364
        inherited pnlProgressoMensagem: TPanel
          Width = 200
          inherited lblProgressoMensagem: TfcLabel
            Width = 198
          end
        end
        inherited pnlProgressoBarra: TPanel
          Left = 201
          Width = 162
          inherited pgbProcesso: TProgressBar
            Width = 160
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 268
    Width = 366
    inherited tb97Fundo: TToolbar97
      Left = 194
      inherited sep3: TToolbarSep97
        Left = 162
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 81
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 25
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 35
    Top = 12
  end
  object qryFundoInvest: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   IDFUNDOINVEST,DESCFUNDOINVEST,CNPJFUNDO,IDTIPOFUNDOINVEST,DTA' +
        'INIPROC'
      'FROM'
      '   FUNDOINVEST'
      'WHERE'
      '   CNPJFUNDO = :CNPJFUNDO'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 136
    Top = 10
    ParamData = <
      item
        DataType = ftString
        Name = 'CNPJFUNDO'
        ParamType = ptUnknown
      end>
    object qryFundoInvestDESCFUNDOINVEST: TStringField
      DisplayLabel = 'Fundo'
      DisplayWidth = 60
      FieldName = 'DESCFUNDOINVEST'
      Origin = 'BASEDADOS.FUNDOINVEST.DESCFUNDOINVEST'
      Size = 60
    end
    object qryFundoInvestCNPJFUNDO: TStringField
      DisplayLabel = 'CNPJ'
      DisplayWidth = 25
      FieldName = 'CNPJFUNDO'
      Origin = 'BASEDADOS.FUNDOINVEST.CNPJFUNDO'
      Size = 25
    end
    object qryFundoInvestIDFUNDOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDFUNDOINVEST'
      Origin = 'BASEDADOS.FUNDOINVEST.IDFUNDOINVEST'
      Visible = False
    end
    object qryFundoInvestIDTIPOFUNDOINVEST: TFloatField
      FieldName = 'IDTIPOFUNDOINVEST'
      Origin = 'BASEDADOS.FUNDOINVEST.IDTIPOFUNDOINVEST'
    end
    object qryFundoInvestDTAINIPROC: TDateTimeField
      FieldName = 'DTAINIPROC'
      Origin = 'BASEDADOS.FUNDOINVEST.DTAINIPROC'
    end
  end
  object OpenDialog1: TOpenDialog
    FileName = 'ArquivoCotaSantander.xls'
    Filter = 'Excel|*.xls'
    InitialDir = 'C:\'
    Title = 'Busca Arquivo de Importação '
    Left = 246
    Top = 68
  end
  object QryInsCotaFundo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO COTAFUNDO'
      '  (IDCOTAFUNDO,IDFUNDOINVEST,DATACOTA,VLRCOTA)'
      'VALUES'
      
        '  (:IDCOTAFUNDO,:IDFUNDOINVEST,TO_DATE(:DATACOTA,'#39'DD/MM/YYYY'#39'),:' +
        'VLRCOTA)'
      ' '
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 200
    Top = 114
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCOTAFUNDO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATACOTA'
        ParamType = ptResult
      end
      item
        DataType = ftFloat
        Name = 'VLRCOTA'
        ParamType = ptUnknown
      end>
  end
  object QryUpdCotaFundo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE COTAFUNDO SET VLRCOTA=:VLRCOTA'
      'WHERE'
      '   IDFUNDOINVEST=:IDFUNDOINVEST AND'
      '   DATACOTA = TO_DATE(:DATACOTA,'#39'DD/MM/YYYY'#39')'
      ' '
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 288
    Top = 114
    ParamData = <
      item
        DataType = ftFloat
        Name = 'VLRCOTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATACOTA'
        ParamType = ptUnknown
      end>
  end
  object qryUpdParamInvest: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE PARAMINVEST SET DATAULTFECHFDO=:DATAULTFECHFDO'
      ' '
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 192
    Top = 10
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAULTFECHFDO'
        ParamType = ptUnknown
      end>
  end
  object qryBuscaCotaFundo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   VLRCOTA'
      'FROM'
      '   COTAFUNDO'
      'WHERE'
      '   (IDFUNDOINVEST = :IDFUNDOINVEST) AND'
      '   (DATACOTA = TO_DATE(:DATACOTA,'#39'DD/MM/YYYY'#39'))'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 272
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATACOTA'
        ParamType = ptUnknown
      end>
    object qryBuscaCotaFundoVLRCOTA: TFloatField
      FieldName = 'VLRCOTA'
    end
  end
  object QryTipoFundoInvest: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT T.*, F.DTAINIPROC'
      'FROM HISTFUNDOINVEST F, TIPOFUNDOINVEST T'
      
        'WHERE (F.IDFUNDOINVEST || TO_CHAR(F.DTAVIGENCIA,'#39'DD/MM/YYYY, HH2' +
        '4:MI:SS'#39') IN'
      
        '      (SELECT HF.IDFUNDOINVEST || TO_CHAR(MAX(HF.DTAVIGENCIA),'#39'D' +
        'D/MM/YYYY, HH24:MI:SS'#39')'
      '       FROM HISTFUNDOINVEST HF'
      '       WHERE'
      '           (HF.IDFUNDOINVEST = :IDFUNDOINVEST)'
      '       AND (HF.DTAVIGENCIA   < TO_DATE(:DATA,'#39'DD/MM/YYYY'#39')+1)'
      '       GROUP BY HF.IDFUNDOINVEST))'
      'AND   (T.IDTIPOFUNDOINVEST = F.IDTIPOFUNDOINVEST)'
      ' ')
    ValidateWithMask = True
    Left = 55
    Top = 40
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATA'
        ParamType = ptInput
      end>
  end
  object qryHistFundoInvest: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '    IDFUNDOINVEST,DESCFUNDOINVEST,CNPJFUNDO,IDTIPOFUNDOINVEST,DT' +
        'AVIGENCIA'
      'FROM'
      '    HISTFUNDOINVEST '
      'WHERE'
      '   (CNPJFUNDO = :CNPJFUNDO) AND'
      '   (DTAVIGENCIA = (SELECT'
      '                      MAX(DTAVIGENCIA)'
      '                   FROM'
      '                      HISTFUNDOINVEST'
      '                   WHERE'
      
        '                      ((CNPJFUNDO = :CNPJFUNDO) and (CNPJFUNDO I' +
        'S NOT NULL))))')
    ValidateWithMask = True
    Left = 48
    Top = 112
    ParamData = <
      item
        DataType = ftString
        Name = 'CNPJFUNDO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CNPJFUNDO'
        ParamType = ptUnknown
      end>
    object StringField1: TStringField
      DisplayLabel = 'Fundo'
      DisplayWidth = 60
      FieldName = 'DESCFUNDOINVEST'
      Origin = 'BASEDADOS.FUNDOINVEST.DESCFUNDOINVEST'
      Size = 60
    end
    object StringField2: TStringField
      DisplayLabel = 'CNPJ'
      DisplayWidth = 25
      FieldName = 'CNPJFUNDO'
      Origin = 'BASEDADOS.FUNDOINVEST.CNPJFUNDO'
      Size = 25
    end
    object FloatField1: TFloatField
      DisplayWidth = 10
      FieldName = 'IDFUNDOINVEST'
      Origin = 'BASEDADOS.FUNDOINVEST.IDFUNDOINVEST'
      Visible = False
    end
    object FloatField2: TFloatField
      FieldName = 'IDTIPOFUNDOINVEST'
      Origin = 'BASEDADOS.FUNDOINVEST.IDTIPOFUNDOINVEST'
    end
  end
end
