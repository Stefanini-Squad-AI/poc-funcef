inherited frmDisponDiverg: TfrmDisponDiverg
  Left = 430
  Top = 217
  Caption = 'Disponibilidades Divergentes'
  ClientHeight = 407
  ClientWidth = 455
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 455
    Height = 368
    object dbgDispDiverg: TwwDBGrid
      Left = 5
      Top = 5
      Width = 445
      Height = 358
      Selected.Strings = (
        'DATADISPFINANC'#9'15'#9'Data'
        'NOMEPLANO'#9'21'#9'Plano'
        'NOMEPATRO'#9'20'#9'Patrocinador')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      DataSource = dsDispDiverg
      ReadOnly = True
      TabOrder = 0
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      OnDblClick = dbgDispDivergDblClick
      IndicatorColor = icBlack
    end
  end
  inherited Dock971: TDock97
    Top = 368
    Width = 455
    inherited tb97Fundo: TToolbar97
      Left = 285
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 118
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 304
    Top = 304
  end
  object qryDispDiverg: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   M.DataDispFinanc,'
      '   PC.NOME AS NOMEPLANO,'
      '   PE.NOME AS NOMEPATRO'
      'FROM'
      '   MovimFinanc M,'
      '   RateioFinanc R,'
      '   PESSOA PE,'
      '   PLANPREVCONTABIL PC'
      'WHERE'
      '   (R.IDPATRO = PE.IDPESSOA(+)) AND'
      '   (R.IDPLANOPREV = PC.IDPLANOPREV(+)) AND'
      '   (M.CodLancFinanc=R.CodLancFinanc) AND'
      '   (TO_CHAR(M.DataDispFinanc,'#39'MM/YYYY'#39') = :MesAno ) AND'
      '   (SELECT'
      '       Sum(Decode(R1.RECPAG,'#39'R'#39',R1.Valor,-R1.Valor)) AS Total'
      '    FROM'
      '       MovimFinanc M1,'
      '       RateioFinanc R1'
      '    WHERE'
      '       (M1.CodLancFinanc = R1.CodLancFinanc) AND'
      '       (M1.DataDispFinanc = M.DataDispFinanc) AND'
      
        '       ((R1.IDPATRO = R.IDPATRO) OR ((R1.IDPATRO IS NULL) AND (R' +
        '.IDPATRO IS NULL))) AND'
      
        '       ((R1.IDPLANOPREV = R.IDPLANOPREV) OR ((R1.IDPLANOPREV IS ' +
        'NULL) AND (R.IDPLANOPREV IS NULL))))<> 0'
      'GROUP BY'
      '   M.DataDispFinanc,'
      '   PC.NOME ,'
      '   PE.NOME')
    ValidateWithMask = True
    Left = 152
    Top = 304
    ParamData = <
      item
        DataType = ftString
        Name = 'MesAno'
        ParamType = ptInput
      end>
  end
  object dsDispDiverg: TwwDataSource
    DataSet = qryDispDiverg
    Left = 232
    Top = 304
  end
end
