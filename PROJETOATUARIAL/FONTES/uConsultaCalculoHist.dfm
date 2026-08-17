inherited frmConsultaCalculoHist: TfrmConsultaCalculoHist
  Left = 182
  Top = 184
  HelpContext = 40244
  Caption = 'Base de Histórico  - Consulta Cálculo'
  ClientWidth = 476
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 476
    object PageControl1: TPageControl
      Left = 5
      Top = 5
      Width = 466
      Height = 224
      ActivePage = TabSheet1
      Align = alClient
      HotTrack = True
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = 'Cálculo'
        object DBGrid: TDBGrid
          Left = 0
          Top = 0
          Width = 458
          Height = 196
          Align = alClient
          Color = clSilver
          DataSource = DtSrcCalculos
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          OnCellClick = DBGridCellClick
          OnColEnter = DBGridColEnter
          Columns = <
            item
              FieldName = 'DT_GERACAO'
              Title.Caption = 'Data '
            end
            item
              FieldName = 'DS_HIPOTESE'
              Title.Caption = 'Hipótese'
            end>
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Variáveis'
        object ChckLstBxVariavel: TCheckListBox
          Left = 0
          Top = 0
          Width = 458
          Height = 196
          Align = alClient
          Color = clSilver
          Columns = 1
          ItemHeight = 13
          TabOrder = 0
        end
      end
    end
  end
  inherited Dock971: TDock97
    Width = 476
    inherited tb97Fundo: TToolbar97
      Left = 229
      DockPos = 229
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 61
      DockPos = 61
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Enabled = False
      end
    end
  end
  object wwqryCalculo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   FI_REFER_CALCULO_ATUARIAL.CD_PESSOA_ENTID,'
      '   FI_REFER_CALCULO_ATUARIAL.CD_PESSOA_PATROC,'
      '   FI_REFER_CALCULO_ATUARIAL.CD_PLANO,'
      '   FI_REFER_CALCULO_ATUARIAL.DT_GERACAO,'
      '   FI_HIPOTESE.DS_HIPOTESE'
      ''
      'FROM FI_BK_REFER_CALCULO_ATUARIAL  FI_REFER_CALCULO_ATUARIAL,'
      '     FI_HIPOTESE  FI_HIPOTESE'
      'WHERE'
      
        '      FI_REFER_CALCULO_ATUARIAL.CD_HIPOTESE = FI_HIPOTESE.CD_HIP' +
        'OTESE'
      
        '  AND FI_REFER_CALCULO_ATUARIAL.CD_PESSOA_ENTID = :CD_PESSOA_ENT' +
        'ID'
      
        '  AND FI_REFER_CALCULO_ATUARIAL.CD_PESSOA_PATROC  = :CD_PESSOA_P' +
        'ATROC'
      '  AND FI_REFER_CALCULO_ATUARIAL.CD_PLANO  = :CD_PLANO'
      'ORDER BY FI_REFER_CALCULO_ATUARIAL.DT_GERACAO DESC')
    Params.Data = {
      010003000F43445F504553534F415F454E544944000304000000000000001043
      445F504553534F415F504154524F43000304000000000000000843445F504C41
      4E4F00030400000000000000}
    ValidateWithMask = True
    Left = 154
    Top = 39
    object wwqryCalculoCD_PESSOA_ENTID: TFloatField
      FieldName = 'CD_PESSOA_ENTID'
      Origin = 'FI_REFER_CALCULO_ATUARIAL.CD_PESSOA_ENTID'
    end
    object wwqryCalculoCD_PESSOA_PATROC: TFloatField
      FieldName = 'CD_PESSOA_PATROC'
      Origin = 'FI_REFER_CALCULO_ATUARIAL.CD_PESSOA_PATROC'
    end
    object wwqryCalculoCD_PLANO: TFloatField
      FieldName = 'CD_PLANO'
      Origin = 'FI_REFER_CALCULO_ATUARIAL.CD_PLANO'
    end
    object wwqryCalculoDT_GERACAO: TDateTimeField
      DisplayWidth = 20
      FieldName = 'DT_GERACAO'
      Origin = 'FI_REFER_CALCULO_ATUARIAL.DT_GERACAO'
    end
    object wwqryCalculoDS_HIPOTESE: TStringField
      FieldName = 'DS_HIPOTESE'
      Origin = 'FI_HIPOTESE.DS_HIPOTESE'
      Size = 50
    end
  end
  object wwqryVariavel: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = DtSrcCalculos
    SQL.Strings = (
      'SELECT DISTINCT FI_OCOR_CALCULO_ATUARIAL.NO_VARIAVEL'
      '  FROM FI_BK_OCOR_CALCULO_ATUARIAL  FI_OCOR_CALCULO_ATUARIAL,'
      '       FI_BK_PARTICIPANTE FI_PARTICIPANTE'
      ' WHERE'
      
        '      FI_OCOR_CALCULO_ATUARIAL.CD_PESSOA_ENTID   = :CD_PESSOA_EN' +
        'TID'
      
        '  AND FI_OCOR_CALCULO_ATUARIAL.CD_PESSOA_PATROC  = :CD_PESSOA_PA' +
        'TROC'
      '  AND FI_OCOR_CALCULO_ATUARIAL.CD_PLANO          = :CD_PLANO'
      '  AND FI_OCOR_CALCULO_ATUARIAL.DT_GERACAO        = :DT_GERACAO'
      
        '  AND FI_PARTICIPANTE.CD_VERSAO = FI_OCOR_CALCULO_ATUARIAL.CD_VE' +
        'RSAO'
      
        '  AND FI_PARTICIPANTE.CD_PARTIC = FI_OCOR_CALCULO_ATUARIAL.CD_PA' +
        'RTIC'
      '  AND FI_PARTICIPANTE.TP_PARTICIPANTE  = '#39'B'#39
      ''
      '     ')
    Params.Data = {
      010004000F43445F504553534F415F454E544944000608000000000000000000
      01001043445F504553534F415F504154524F4300060800000000000000000001
      000843445F504C414E4F00060800000000000000000001000A44545F47455241
      43414F000B080000002C845D40CB420100}
    ValidateWithMask = True
    Left = 234
    Top = 44
  end
  object DtSrcVariavel: TDataSource
    DataSet = wwqryVariavel
    Left = 214
    Top = 42
  end
  object DtSrcCalculos: TDataSource
    DataSet = wwqryCalculo
    Left = 131
    Top = 37
  end
end
  Top = 37
  end
end
