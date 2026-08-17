inherited frmParamRegra: TfrmParamRegra
  Left = 225
  Top = 163
  Caption = 'Parametrização da Regra'
  ClientHeight = 218
  ClientWidth = 375
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 375
    Height = 179
    object GroupBox1: TGroupBox
      Left = 11
      Top = 6
      Width = 354
      Height = 163
      Caption = 'Forma de Visualização nos Passos da Regra'
      TabOrder = 0
      object SbtnAlterar: TSpeedButton
        Left = 244
        Top = 134
        Width = 101
        Height = 25
        Caption = '&Alterar Passos'
        Flat = True
        Visible = False
        OnClick = SbtnAlterarClick
      end
      object sbtnAcertar: TSpeedButton
        Left = 135
        Top = 134
        Width = 106
        Height = 25
        Caption = '&Acertar Formulas'
        Flat = True
        Visible = False
        OnClick = sbtnAcertarClick
      end
      object dbrbCampo: TDBRadioGroup
        Left = 8
        Top = 24
        Width = 338
        Height = 51
        Caption = 'Campo da Regra'
        Columns = 2
        DataField = 'FLGCAMPO'
        DataSource = ds
        Items.Strings = (
          'Identificador'
          'Descriçao')
        TabOrder = 0
        Values.Strings = (
          '1'
          '0')
      end
      object dbrbVariavel: TDBRadioGroup
        Left = 8
        Top = 80
        Width = 338
        Height = 51
        Caption = 'Variável da Regra'
        Columns = 2
        DataField = 'FLGVARIAVEL'
        DataSource = ds
        Items.Strings = (
          'Identificador'
          'Descriçao')
        TabOrder = 1
        Values.Strings = (
          '1'
          '0')
      end
    end
  end
  inherited Dock971: TDock97
    Top = 179
    Width = 375
    inherited tb97Fundo: TToolbar97
      Left = 209
      DockPos = 209
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 235
    Top = 75
  end
  object Qry: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      FLGCAMPO, FLGVARIAVEL'
      'FROM'
      '    PARAMREGRA')
    UpdateObject = Upd
    ValidateWithMask = True
    Left = 288
    Top = 24
  end
  object ds: TwwDataSource
    DataSet = Qry
    Left = 320
    Top = 24
  end
  object Upd: TUpdateSQL
    ModifySQL.Strings = (
      'update PARAMREGRA'
      'set'
      '  FLGCAMPO = :FLGCAMPO,'
      '  FLGVARIAVEL = :FLGVARIAVEL'
      'where'
      '  FLGCAMPO = :OLD_FLGCAMPO and'
      '  FLGVARIAVEL = :OLD_FLGVARIAVEL')
    InsertSQL.Strings = (
      'insert into PARAMREGRA'
      '  (FLGCAMPO, FLGVARIAVEL)'
      'values'
      '  (:FLGCAMPO, :FLGVARIAVEL)')
    DeleteSQL.Strings = (
      'delete from PARAMREGRA'
      'where'
      '  FLGCAMPO = :OLD_FLGCAMPO and'
      '  FLGVARIAVEL = :OLD_FLGVARIAVEL')
    Left = 296
    Top = 72
  end
  object QryDet: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '      IDREGRA, IDALGORITMODAREG, IDCAMPO, FORMULA1, CORRELACAO, ' +
        'FORMULA2,'
      
        '      IDCAMPO2, VALOR, TIPOALGORITMO, DESCRICAOALGORIT, ALGORSUB' +
        'SEQTRUE,'
      '      ALGORSUBSEQFALSE, TIPOCAMPO1, TIPOCAMPO2, FORMATACAO'
      'FROM'
      '    ALGREGRA'
      'ORDER BY'
      '      IDREGRA, IDALGORITMODAREG')
    UpdateObject = updDet
    ValidateWithMask = True
    Left = 43
    Top = 102
  end
  object dsDet: TwwDataSource
    DataSet = QryDet
    Left = 83
    Top = 102
  end
  object updDet: TUpdateSQL
    ModifySQL.Strings = (
      'update ALGREGRA'
      'set'
      '  IDREGRA = :IDREGRA,'
      '  IDALGORITMODAREG = :IDALGORITMODAREG,'
      '  IDCAMPO = :IDCAMPO,'
      '  FORMULA1 = :FORMULA1,'
      '  CORRELACAO = :CORRELACAO,'
      '  FORMULA2 = :FORMULA2,'
      '  IDCAMPO2 = :IDCAMPO2,'
      '  VALOR = :VALOR,'
      '  TIPOALGORITMO = :TIPOALGORITMO,'
      '  DESCRICAOALGORIT = :DESCRICAOALGORIT,'
      '  ALGORSUBSEQTRUE = :ALGORSUBSEQTRUE,'
      '  ALGORSUBSEQFALSE = :ALGORSUBSEQFALSE,'
      '  TIPOCAMPO1 = :TIPOCAMPO1,'
      '  TIPOCAMPO2 = :TIPOCAMPO2,'
      '  FORMATACAO = :FORMATACAO'
      'where'
      '  IDREGRA = :OLD_IDREGRA and'
      '  IDALGORITMODAREG = :OLD_IDALGORITMODAREG')
    InsertSQL.Strings = (
      'insert into ALGREGRA'
      '  (IDREGRA, IDALGORITMODAREG, IDCAMPO, FORMULA1, CORRELACAO, '
      'FORMULA2, '
      '   IDCAMPO2, VALOR, TIPOALGORITMO, DESCRICAOALGORIT, '
      'ALGORSUBSEQTRUE, ALGORSUBSEQFALSE, '
      '   TIPOCAMPO1, TIPOCAMPO2, FORMATACAO)'
      'values'
      
        '  (:IDREGRA, :IDALGORITMODAREG, :IDCAMPO, :FORMULA1, :CORRELACAO' +
        ', '
      ':FORMULA2, '
      '   :IDCAMPO2, :VALOR, :TIPOALGORITMO, :DESCRICAOALGORIT, '
      ':ALGORSUBSEQTRUE, '
      '   :ALGORSUBSEQFALSE, :TIPOCAMPO1, :TIPOCAMPO2, :FORMATACAO)')
    DeleteSQL.Strings = (
      'delete from ALGREGRA'
      'where'
      '  IDREGRA = :OLD_IDREGRA and'
      '  IDALGORITMODAREG = :OLD_IDALGORITMODAREG')
    Left = 91
    Top = 70
  end
  object QryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 139
    Top = 54
  end
  object QryFormulas: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT IDFORMULA, EXPRESSAOREAL, EXPRESSAOFORMULA FROM FORMULA W' +
        'HERE EXPRESSAOREAL <> EXPRESSAOFORMULA ')
    UpdateObject = udpFormula
    ValidateWithMask = True
    Left = 179
    Top = 14
  end
  object dsFormulas: TwwDataSource
    DataSet = QryFormulas
    Left = 147
    Top = 14
  end
  object udpFormula: TUpdateSQL
    ModifySQL.Strings = (
      'update FORMULA'
      'set'
      '  EXPRESSAOREAL = :EXPRESSAOREAL'
      'where'
      '  IDFORMULA = :OLD_IDFORMULA')
    InsertSQL.Strings = (
      'insert into FORMULA'
      '  (EXPRESSAOREAL)'
      'values'
      '  (:EXPRESSAOREAL)')
    DeleteSQL.Strings = (
      'delete from FORMULA'
      'where'
      '  IDFORMULA = :OLD_IDFORMULA')
    Left = 211
    Top = 14
  end
end
