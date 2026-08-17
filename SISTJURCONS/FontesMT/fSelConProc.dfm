inherited frmSelConProc: TfrmSelConProc
  Left = 89
  Top = 121
  HelpContext = 7190025
  Caption = 'Consulta Geral de Processos'
  FormStyle = fsMDIChild
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    inherited pgctrlPrincipal: TPageControl [0]
    end
    inherited pnResult: TPanel [1]
      object dbgdConProc: TwwDBGrid
        Left = 1
        Top = 1
        Width = 617
        Height = 360
        Selected.Strings = (
          'NOME'#9'35'#9'Contraparte '
          'NOMEVARA'#9'40'#9'Órgão Jurisd'
          'NUMVARAJUSTICA'#9'10'#9'Vara Nº'
          'PROCJCJNUM'#9'15'#9'Número do Processo'
          'DATANOTIF'#9'10'#9'Data Notif.'
          'DATAEFETENC'#9'11'#9'Data Encerram.'
          'CUSTOPROC'#9'10'#9'Custo'
          'ENCERRADO'#9'10'#9'Encerrado?'
          'NUMPROCTRAB'#9'12'#9'Num.Interno')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = dsProcesso
        KeyOptions = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgWordWrap]
        TabOrder = 0
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        UseTFields = False
        IndicatorColor = icBlack
      end
    end
  end
  inherited Dock971: TDock97
    object bbtnDetalhe: TBitBtn
      Left = 0
      Top = 3
      Width = 96
      Height = 33
      Hint = 'Ver Todos os Dados do Processo Apontado'
      Cancel = True
      Caption = '&Detalhes'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      Visible = False
      OnClick = bbtnDetalheClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555000000
        000055555F77777777775555000FFFFFFFF0555F777F5FFFF55755000F0F0000
        FFF05F777F7F77775557000F0F0FFFFFFFF0777F7F7F5FFFFFF70F0F0F0F0000
        00F07F7F7F7F777777570F0F0F0FFFFFFFF07F7F7F7F5FFFFFF70F0F0F0F0000
        00F07F7F7F7F777777570F0F0F0FFFFFFFF07F7F7F7F5FFF55570F0F0F0F000F
        FFF07F7F7F7F77755FF70F0F0F0FFFFF00007F7F7F7F5FF577770F0F0F0F00FF
        0F057F7F7F7F77557F750F0F0F0FFFFF00557F7F7F7FFFFF77550F0F0F000000
        05557F7F7F77777775550F0F0000000555557F7F7777777555550F0000000555
        55557F7777777555555500000005555555557777777555555555}
      NumGlyphs = 2
      Spacing = 2
    end
  end
  inherited sqlProcesso: TCMSqlParams
    SQL.Strings = (
      'SELECT DISTINCT'
      
        '  PT.*, RECLAMANTES.*, ENDRECLAMANTES.*, CI.IDESTADO, VJ.DESCRIC' +
        'AO AS NOMEVARA'
      'FROM'
      '  PROCESSOTRAB PT, CIDADES CI, VARAJUSTICA VJ,'
      '  (SELECT'
      '     P.IDPESSOA, P.TIPO, P.NUMDOCUMENTO,'
      '     DECODE(P.TIPO,'#39'F'#39',P.NOME,P.RAZAOSOCIAL) AS NOME'
      '   FROM'
      '     PESSOA P, PROCESSOTRAB PT'
      '   WHERE'
      '     (PT.INDMATERIA   > 3) AND'
      '     (PT.IDRECLAMANTE = P.IDPESSOA)'
      '  ) RECLAMANTES,'
      '  (SELECT'
      '     P.IDPESSOA, CI.NOME AS CIDADE, EP.LOGRADOURO, EP.CODESTADO,'
      '     EP.NUMERO, EP.COMPLEMENTO, EP.BAIRRO, EP.CEP, ES.NOMEESTADO'
      '   FROM'
      
        '     PESSOA P, ENDPESS EP, PROCESSOTRAB PT, CIDADES CI, ESTADO E' +
        'S'
      '   WHERE'
      '(1 =2) and'
      '     (PT.INDMATERIA   > 3) AND'
      '     (PT.IDRECLAMANTE      = P.IDPESSOA) AND'
      '     (((P.TIPO             = '#39'F'#39') AND'
      '       (P.IDENDRESIDENCIAL = EP.IDENDERECO)) OR'
      '      ((P.TIPO             = '#39'J'#39') AND'
      '       (P.IDENDCOMERCIAL   = EP.IDENDERECO))) AND'
      '     (EP.IDCIDADES         = CI.IDCIDADES(+)) AND'
      '     (CI.IDESTADO          = ES.IDESTADO(+))'
      '  ) ENDRECLAMANTES'
      'WHERE'
      '  (PT.INDMATERIA > 3) AND'
      '  (PT.TRGDTINCLUSAO <= TO_DATE('#39'24/06/2003'#39','#39'DD/MM/YYYY'#39')) AND'
      '  (PT.DATAJUIZO <= TO_DATE('#39'23/06/2003'#39','#39'DD/MM/YYYY'#39')) AND'
      '  (PT.DATANOTIF <= TO_DATE('#39'23/06/2003'#39','#39'DD/MM/YYYY'#39')) AND'
      
        '  (FLGSITPROC = 0 OR (PT.DATAEFETENC <= TO_DATE('#39'23/06/2003'#39','#39'DD' +
        '/MM/YYYY'#39'))) AND'
      '  (PT.IDRECLAMANTE  = RECLAMANTES.IDPESSOA) AND'
      '  (PT.IDRECLAMANTE  = ENDRECLAMANTES.IDPESSOA(+)) AND'
      '  (PT.IDVARAJUSTICA = VJ.IDVARAJUSTICA(+)) AND'
      '  (PT.IDCIDADES     = CI.IDCIDADES(+))'
      'ORDER BY'
      '  RECLAMANTES.NOME')
    Top = 336
  end
end
