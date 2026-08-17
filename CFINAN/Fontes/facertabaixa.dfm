inherited frmAcertaBaixa: TfrmAcertaBaixa
  Left = 268
  Top = 217
  Caption = 'Acerta Baixa'
  ClientHeight = 230
  ClientWidth = 366
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 366
    Height = 191
    object RichEdit1: TRichEdit
      Left = 5
      Top = 5
      Width = 356
      Height = 68
      Align = alTop
      Enabled = False
      Lines.Strings = (
        'A T E N Ç Ã O:'
        ''
        'Este procedimento acertará a contabilização das baixas no '
        'período indicado.')
      TabOrder = 0
    end
    object GroupBox1: TGroupBox
      Left = 16
      Top = 90
      Width = 337
      Height = 65
      Caption = ' Faixa de Datas '
      TabOrder = 1
      object Label1: TLabel
        Left = 16
        Top = 16
        Width = 35
        Height = 13
        Caption = 'Inicial'
      end
      object Label2: TLabel
        Left = 192
        Top = 16
        Width = 28
        Height = 13
        Caption = 'Final'
      end
      object deDataFim: TCMDateTimePicker
        Left = 192
        Top = 32
        Width = 121
        Height = 21
        TabOrder = 1
      end
      object deDataIni: TCMDateTimePicker
        Left = 16
        Top = 32
        Width = 121
        Height = 21
        TabOrder = 0
      end
    end
    object prgBarAtuFluxo: TProgressBar
      Left = 5
      Top = 164
      Width = 356
      Height = 22
      Align = alBottom
      Min = 0
      Max = 100
      Step = 2
      TabOrder = 2
      Visible = False
    end
  end
  inherited Dock971: TDock97
    Top = 191
    Width = 366
    inherited tb97Fundo: TToolbar97
      Left = 170
      DockPos = 170
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 2
      DockPos = 2
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryPlanil: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.PLNCODIGO,L.LACNUMLAN, P.PLNDATDIA,L.LACVALOR,'
      '       P.PERNUMERO, P.PEREXERCICIO, L.LACNUMDOC,L.PLACONTA,'
      '       L.LACHIST1,L.LACHIST2,L.LACHIST3,L.LACHIST4,'
      '       L.LACHIST5,L.LACDEBCRE,P.IDMODULO   '
      'FROM LANCAMENTO L, PLANILHA P'
      'WHERE (P.PLNCODIGO = :PLNCODIGO) AND'
      '      (RTRIM(L.PLACONTA) = :PLACONTA) AND'
      '      (P.PLNCODIGO = L.PLNCODIGO)')
    Params.Data = {
      0100020009504C4E434F4449474F0003040000000000000008504C41434F4E54
      410001020030000000}
    ValidateWithMask = True
    Left = 191
    Top = 45
  end
  object qry: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT L.PLNCODIGO, P.PLACONTA, P.UNIDNEGOC'
      'FROM LANCTODOCUM L, RECBTOPAGTO R, PORTADORFORMA P, DOCUMENTO D'
      'WHERE (RTRIM(L.OPERACAO) = '#39'5'#39') AND'
      '      (D.RECPAG = '#39'P'#39') AND'
      '      (D.IDPESSOA = :IDPESSOA) AND'
      '      (L.DATALANCTO >= TO_DATE(:DATAINI,'#39'DD/MM/YYYY'#39')) AND'
      '      (L.DATALANCTO <= TO_DATE(:DATAFIM,'#39'DD/MM/YYYY'#39')) AND'
      '      (P.UNIDNEGOC IS NOT NULL) AND'
      '      (D.CODDOCUMENTO = L.CODDOCUMENTO) AND '
      '      (L.CODDOCUMENTO = R.CODDOCUMENTO) AND'
      '      (L.NUMLANCTO = R.NUMLANCTO) AND'
      '      (R.CODPORTFORMA = P.CODPORTFORMA)'
      '')
    Params.Data = {
      01000300084944504553534F41000304000000000000000744415441494E4900
      01020030000000074441544146494D0001020030000000}
    ValidateWithMask = True
    Left = 254
    Top = 45
  end
end
wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww
