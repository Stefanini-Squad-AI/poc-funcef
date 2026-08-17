inherited frmExecGeraArquivoMargem13: TfrmExecGeraArquivoMargem13
  Left = 160
  Top = 171
  Caption = 'Geração de Arquivo de Margens para 13º'
  ClientHeight = 151
  ClientWidth = 606
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 16
    Top = 5
    Width = 98
    Height = 13
    Caption = 'Nome do Arquivo'
  end
  object SpeedButton1: TSpeedButton [1]
    Left = 489
    Top = 21
    Width = 23
    Height = 22
    Flat = True
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
      333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
      0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
      07333337F3FF3FFF7F333330F00F000F07333337F77377737F333330FFFFFFFF
      07333FF7F3FFFF3F7FFFBBB0F0000F0F0BB37777F7777373777F3BB0FFFFFFFF
      0BBB3777F3FF3FFF77773330F00F000003333337F773777773333330FFFF0FF0
      33333337F3FF7F37F3333330F08F0F0B33333337F7737F77FF333330FFFF003B
      B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
      3BB33773333773333773B333333B3333333B7333333733333337}
    NumGlyphs = 2
  end
  object Label3: TLabel [2]
    Left = 16
    Top = 56
    Width = 39
    Height = 13
    Caption = 'Label3'
  end
  inherited pnlFundo: TPanel
    Width = 606
    Height = 112
    object Label2: TLabel
      Left = 16
      Top = 58
      Width = 98
      Height = 13
      Caption = 'Nome do Arquivo'
    end
    object SpeedButton2: TSpeedButton
      Left = 568
      Top = 72
      Width = 23
      Height = 22
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
        333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
        0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
        07333337F3FF3FFF7F333330F00F000F07333337F77377737F333330FFFFFFFF
        07333FF7F3FFFF3F7FFFBBB0F0000F0F0BB37777F7777373777F3BB0FFFFFFFF
        0BBB3777F3FF3FFF77773330F00F000003333337F773777773333330FFFF0FF0
        33333337F3FF7F37F3333330F08F0F0B33333337F7737F77FF333330FFFF003B
        B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
        3BB33773333773333773B333333B3333333B7333333733333337}
      NumGlyphs = 2
      OnClick = SpeedButton2Click
    end
    inline molMutuario: TmolMutuario
      Left = 8
      Top = 8
      Width = 593
      Height = 41
      Visible = False
      inherited btnBuscaPart: TBitBtn
        Left = 536
        OnClick = molMutuariobtnBuscaPartClick
      end
      inherited btnLimpaPart: TBitBtn
        Left = 560
        OnClick = molMutuariobtnLimpaPartClick
      end
      inherited edtNome: TEdit
        Width = 337
      end
    end
  end
  inherited Dock971: TDock97
    Top = 112
    Width = 606
    inherited tb97Fundo: TToolbar97
      Left = 367
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 230101
        ClickHelpContext = 230101
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  object edtNomeArquivo: TEdit [5]
    Left = 16
    Top = 72
    Width = 553
    Height = 21
    TabOrder = 1
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 147
    Top = 65486
    TargetsData = (
      1
      1
      (
        'TwwDBRichEdit'
        'Text'
        0))
  end
  object OpenDialog: TOpenDialog
    DefaultExt = 'txt'
    FileName = 'SIAFI*.TXT'
    Filter = 'Arquivos SIAFI|TP*.txt'
    Left = 432
    Top = 16
  end
  object qryParticipante: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   DEP.IDTITULAR, DEP.IDPESSOA,'
      '   ELP.IDPESSJUR,'
      '   DEP.MATRICULA,'
      '   PPP.IDSITPART,'
      '   NVL(BFC.IDPLANOPREV, PPP.IDPLANOPREV) AS IDPLANOPREV'
      'FROM'
      '   PARTPREVPLAN PPP,'
      '   ELEGPATRO    ELP,'
      '   DEPENTIT     DEP,'
      '   SITPART      SIT,'
      '   ('
      '   SELECT DISTINCT'
      '      IDPESSOA, IDPLANOPREV'
      '   FROM'
      '      BENEFBFCIARIO'
      '   WHERE'
      
        '          (DATAFINAL IS NULL OR DATAFINAL > (SELECT SYSDATE FROM' +
        ' DUAL))'
      '      AND IDSITBENEFICIO IN (1, 2, 7)'
      '   ) BFC'
      'WHERE'
      '       PPP.FLGDESATIVADO  = 0'
      '   AND (:PIDBENEF         IS NULL OR CON.IDBENEF =:PIDBENEF)'
      '   AND ELP.IDPESSJUR      = PPP.IDPESSJUR'
      '   AND ELP.IDPESSOA       = PPP.IDPESSOA'
      '   AND ELP.IDPESSOA       = DEP.IDTITULAR'
      '   AND DEP.IDPESSOA       = BFC.IDPESSOA(+)'
      '   AND PPP.IDSITPART      = SIT.IDSITPART'
      
        '   AND (ELP.IDPESSOA      = DEP.IDPESSOA  OR (ELP.IDPESSOA <> DE' +
        'P.IDPESSOA AND DEP.IDPESSOA = BFC.IDPESSOA))'
      
        '   AND (ELP.IDPESSOA      = DEP.IDPESSOA  OR SIT.FLGINTERNO = '#39'C' +
        'A'#39')'
      
        '   AND (DEP.IDDEPENDENCIA = '#39'PRP'#39'         OR SIT.FLGINTERNO = '#39'C' +
        'A'#39')')
    ValidateWithMask = True
    Left = 344
    Top = 16
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDBENEF'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDBENEF'
        ParamType = ptInput
      end>
    object qryParticipanteIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
    end
    object qryParticipanteMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Size = 15
    end
    object qryParticipanteIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qryParticipanteIDTITULAR: TFloatField
      FieldName = 'IDTITULAR'
    end
    object qryParticipanteIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryParticipanteIDSITPART: TFloatField
      FieldName = 'IDSITPART'
    end
  end
end
