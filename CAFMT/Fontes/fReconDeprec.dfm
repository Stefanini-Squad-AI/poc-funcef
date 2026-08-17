inherited frmReconDeprec: TfrmReconDeprec
  Left = 214
  Top = 81
  Caption = 'Reconstrói os Fechamentos de Periodo'
  ClientHeight = 214
  ClientWidth = 344
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 344
    Height = 175
    object Label1: TLabel
      Left = 111
      Top = 26
      Width = 92
      Height = 13
      Caption = 'Fechamento até'
    end
    object pnlStatus: TPanel
      Left = 5
      Top = 96
      Width = 334
      Height = 74
      Align = alBottom
      TabOrder = 0
      Visible = False
      object lblStatus: TLabel
        Left = 8
        Top = 36
        Width = 64
        Height = 13
        Caption = 'Mês 99/9999'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object lblPlaca: TLabel
        Left = 8
        Top = 3
        Width = 27
        Height = 13
        Caption = 'Placa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object pnlprgBar: TPanel
        Left = 9
        Top = 51
        Width = 316
        Height = 17
        BevelOuter = bvLowered
        Caption = 'pnlprgBar'
        TabOrder = 0
        object prgBar: TGauge
          Left = 1
          Top = 1
          Width = 314
          Height = 15
          Align = alClient
          BackColor = clSilver
          BorderStyle = bsNone
          Color = clGray
          ForeColor = clBlue
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Progress = 0
        end
      end
      object pnlprgBar1: TPanel
        Left = 9
        Top = 17
        Width = 316
        Height = 17
        BevelOuter = bvLowered
        Caption = 'pnlprgBar'
        TabOrder = 1
        object prgBar1: TGauge
          Left = 1
          Top = 1
          Width = 314
          Height = 15
          Align = alClient
          BackColor = clSilver
          BorderStyle = bsNone
          Color = clGray
          ForeColor = clBlue
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Progress = 0
        end
      end
    end
    object eDtaFim: TCMDateTimePicker
      Left = 111
      Top = 42
      Width = 133
      Height = 24
      Hint = 'Data Programada para Pagamento'
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      ButtonStyle = cbsCustom
      Epoch = 1950
      ButtonGlyph.Data = {
        06050000424D06050000000000003604000028000000100000000D0000000100
        080000000000D000000000000000000000000001000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A6000020400000206000002080000020A0000020C0000020E000004000000040
        20000040400000406000004080000040A0000040C0000040E000006000000060
        20000060400000606000006080000060A0000060C0000060E000008000000080
        20000080400000806000008080000080A0000080C0000080E00000A0000000A0
        200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
        200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
        200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
        20004000400040006000400080004000A0004000C0004000E000402000004020
        20004020400040206000402080004020A0004020C0004020E000404000004040
        20004040400040406000404080004040A0004040C0004040E000406000004060
        20004060400040606000406080004060A0004060C0004060E000408000004080
        20004080400040806000408080004080A0004080C0004080E00040A0000040A0
        200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
        200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
        200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
        20008000400080006000800080008000A0008000C0008000E000802000008020
        20008020400080206000802080008020A0008020C0008020E000804000008040
        20008040400080406000804080008040A0008040C0008040E000806000008060
        20008060400080606000806080008060A0008060C0008060E000808000008080
        20008080400080806000808080008080A0008080C0008080E00080A0000080A0
        200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
        200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
        200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
        2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
        2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
        2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
        2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
        2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
        2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
        2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
        000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
        A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
        A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
        A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
        FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
        04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
        000000000000000000FF}
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      ShowButton = True
      TabOrder = 1
      OnExit = eDtaFimExit
    end
  end
  inherited Dock971: TDock97
    Top = 175
    Width = 344
    inherited tb97Fundo: TToolbar97
      Left = 174
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 7
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Enabled = False
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 715
    Top = 531
  end
  object qryBem1: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT B.IDBEM,B.IDPESSOA,B.IDMODULO,B.PLACA,B.DESBEM,B.DTAINCLU' +
        'SAO,'
      '       B.DATAINICIODEP,B.DATAULTDEP,B.IDGRUPO'
      'FROM BEM B,'
      '     GRUPO G'
      'WHERE (B.IDPESSOA = :IDPESSOA)'
      '  AND (B.CONTROLE = '#39'T'#39')'
      '  AND (B.BAIXATOTAL <> '#39'S'#39')'
      '  AND (G.FLGIMOVEL = 0)'
      '  AND (B.IDGRUPO = G.IDGRUPO)'
      'ORDER BY G.CLASSE, B.PLACA '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 32
    Top = 16
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryUpdGrupo: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM GRUPO  G,'
      '     PLANOGRUPO P'
      'WHERE (P.IDPESSOA = :PIDPESSOA)'
      '  AND (G.TIPO     = '#39'A'#39')'
      '  AND (G.STATUS   = '#39'A'#39')'
      'ORDER BY G.NOME'
      '')
    UpdateObject = updGrupo
    ValidateWithMask = True
    Left = 424
    Top = 24
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
    object qryUpdGrupoIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
      Origin = 'GRUPO.IDGRUPO'
    end
    object qryUpdGrupoMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
      Origin = 'GRUPO.MOECODIGO'
    end
    object qryUpdGrupoNOME: TStringField
      FieldName = 'NOME'
      Origin = 'GRUPO.NOME'
      Size = 60
    end
    object qryUpdGrupoTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'GRUPO.TIPO'
      Size = 1
    end
    object qryUpdGrupoSTATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'GRUPO.STATUS'
      Size = 1
    end
    object qryUpdGrupoVALALUGUEL: TFloatField
      FieldName = 'VALALUGUEL'
      Origin = 'GRUPO.VALALUGUEL'
    end
    object qryUpdGrupoDEPRECIACAO: TFloatField
      FieldName = 'DEPRECIACAO'
      Origin = 'GRUPO.DEPRECIACAO'
    end
    object qryUpdGrupoCLASSE: TStringField
      FieldName = 'CLASSE'
      Origin = 'GRUPO.CLASSE'
      Size = 15
    end
    object qryUpdGrupoDATAULTDEP: TDateTimeField
      FieldName = 'DATAULTDEP'
      Origin = 'GRUPO.DATAULTDEP'
    end
    object qryUpdGrupoDATARECALCDEP: TDateTimeField
      FieldName = 'DATARECALCDEP'
      Origin = 'GRUPO.DATARECALCDEP'
    end
    object qryUpdGrupoULTIDBEM: TFloatField
      FieldName = 'ULTIDBEM'
      Origin = 'GRUPO.ULTIDBEM'
    end
    object qryUpdGrupoFLGIMOVEL: TFloatField
      FieldName = 'FLGIMOVEL'
      Origin = 'GRUPO.FLGIMOVEL'
    end
  end
  object updGrupo: TUpdateSQL
    ModifySQL.Strings = (
      'update GRUPO'
      'set'
      '  IDGRUPO = :IDGRUPO,'
      '  MOECODIGO = :MOECODIGO,'
      '  NOME = :NOME,'
      '  TIPO = :TIPO,'
      '  STATUS = :STATUS,'
      '  VALALUGUEL = :VALALUGUEL,'
      '  DEPRECIACAO = :DEPRECIACAO,'
      '  CLASSE = :CLASSE,'
      '  DATAULTDEP = :DATAULTDEP,'
      '  DATARECALCDEP = :DATARECALCDEP,'
      '  ULTIDBEM = :ULTIDBEM,'
      '  FLGIMOVEL = :FLGIMOVEL'
      'where'
      '  IDGRUPO = :OLD_IDGRUPO')
    InsertSQL.Strings = (
      'insert into GRUPO'
      
        '  (IDGRUPO, MOECODIGO, NOME, TIPO, STATUS, VALALUGUEL, DEPRECIAC' +
        'AO, CLASSE, '
      '   DATAULTDEP, DATARECALCDEP, ULTIDBEM, FLGIMOVEL)'
      'values'
      
        '  (:IDGRUPO, :MOECODIGO, :NOME, :TIPO, :STATUS, :VALALUGUEL, :DE' +
        'PRECIACAO, '
      '   :CLASSE, :DATAULTDEP, :DATARECALCDEP, :ULTIDBEM, :FLGIMOVEL)')
    DeleteSQL.Strings = (
      'delete from GRUPO'
      'where'
      '  IDGRUPO = :OLD_IDGRUPO')
    Left = 424
    Top = 72
  end
  object qryPrimDeprec: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT MIN(DATAMOVIMENTACAO) AS DATAINICIODEP'
      'FROM HISTORICOMOVIMENTACAO'
      'WHERE (IDBEM = :IDBEM)'
      '  AND (IDPESSOA = :IDPESSOA)'
      '  AND ((IDTIPOMOVIMENTACAO = 17) OR (IDTIPOMOVIMENTACAO = 14))'
      ' ')
    ValidateWithMask = True
    Left = 288
    Top = 32
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryUltDeprec: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT MAX(DATAMOVIMENTACAO) AS DATAULTDEP'
      'FROM HISTORICOMOVIMENTACAO'
      'WHERE (IDBEM = :IDBEM)'
      '  AND (IDPESSOA = :IDPESSOA)'
      '  AND ((IDTIPOMOVIMENTACAO = 17) OR (IDTIPOMOVIMENTACAO = 14) OR'
      '       (IDTIPOMOVIMENTACAO = 18) OR (IDTIPOMOVIMENTACAO = 35))'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 288
    Top = 16
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
end
