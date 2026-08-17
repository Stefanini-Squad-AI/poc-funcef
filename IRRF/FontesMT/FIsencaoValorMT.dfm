inherited frmIsencaoValorMT: TfrmIsencaoValorMT
  Left = 373
  Top = 181
  HelpContext = 240019
  Caption = 'Isenção Retroativa'
  ClientHeight = 428
  ClientWidth = 676
  Constraints.MinHeight = 455
  Constraints.MinWidth = 642
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 676
    Height = 389
    object pcValoresNegativos: TPageControl
      Left = 2
      Top = 2
      Width = 672
      Height = 383
      ActivePage = tbsIsencao
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
      object tbsIsencao: TTabSheet
        Caption = 'Isenção Retroativa'
        ImageIndex = 2
        object pnl_isensao: TPanel
          Left = 0
          Top = 4
          Width = 662
          Height = 34
          Anchors = [akLeft, akTop, akRight]
          BevelInner = bvRaised
          BevelOuter = bvLowered
          TabOrder = 0
          object Label4: TLabel
            Left = 8
            Top = 9
            Width = 94
            Height = 13
            Caption = 'Ano da Isenção:'
          end
          object btnTodosIsencao: TSpeedButton
            Left = 407
            Top = 4
            Width = 125
            Height = 27
            Hint = 'Marca todas as autorizações'
            AllowAllUp = True
            Anchors = [akTop, akRight]
            Caption = 'Marcar todas'
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888FFFFF8888888888000008888888888F777778FF888888006666600
              88888887788888778F88887666666666088888788888888878F887E668866666
              608887F88FFF888887F887E6FFF8666660888788777FF888878F7E66FFFF8666
              66087F887777FF88887F7E66FFFFF86666087F8877777FF8887F7E66FF8FFF86
              66087F8877F777FF887F7E66FF86FFF866087F8877F8777F887F7E66FF666FF8
              660878F87788877FF87887E6666666FF608887F88888887787F887E666666666
              6088878F888888888788887EE666666608888878FF88888F788888877EEEEE77
              8888888778FFFF77888888888777778888888888877777888888}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = btnTodasClick
          end
          object btnInverteIsencao: TSpeedButton
            Left = 533
            Top = 4
            Width = 125
            Height = 27
            Hint = 'Desmarca todas as autorizações'
            AllowAllUp = True
            Anchors = [akTop, akRight]
            Caption = 'Inverter seleção'
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              0400000000008000000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888488888888888888844888888888888444448888888888444444488
              1888884444444888118884448844888881188448884888888118844888888188
              8118844888881188111888448881111111888884881111111888888888811111
              8888888888881188888888888888818888888888888888888888}
            ParentShowHint = False
            ShowHint = True
            OnClick = btnInverterClick
          end
          object udIsencao: TUpDown
            Left = 209
            Top = 6
            Width = 16
            Height = 21
            Associate = edtIsencao
            Min = 2002
            Max = 3000
            Position = 2008
            TabOrder = 1
            Thousands = False
            Wrap = False
          end
          object edtIsencao: TEdit
            Left = 120
            Top = 6
            Width = 89
            Height = 21
            TabOrder = 0
            Text = '2008'
          end
          object btnSelIsencao: TBitBtn
            Left = 276
            Top = 4
            Width = 129
            Height = 27
            Hint = 'Selecionar as pessoas com rendimentos negativos'
            Anchors = [akTop, akRight]
            Caption = '&Seleciona'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
            OnClick = btnSelIsencaoClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
              55555555FFFFFFFF5555555000000005555555577777777FF555550999999900
              55555575555555775F55509999999901055557F55555557F75F5001111111101
              105577FFFFFFFF7FF75F00000000000011057777777777775F755070FFFFFF0F
              01105777F555557F75F75500FFFFFF0FF0105577F555FF7F57575550FF700008
              8F0055575FF7777555775555000888888F005555777FFFFFFF77555550000000
              0F055555577777777F7F555550FFFFFF0F05555557F5FFF57F7F555550F000FF
              0005555557F777557775555550FFFFFF0555555557F555FF7F55555550FF7000
              05555555575FF777755555555500055555555555557775555555}
            NumGlyphs = 2
          end
        end
        object dbgIsencao: TwwDBGrid
          Left = 0
          Top = 40
          Width = 662
          Height = 313
          ControlType.Strings = (
            'FLGBUSCA;CheckBox;S;N')
          PictureMasks.Strings = (
            'VALOR'#9'#,##0.00'#9'T'#9'T')
          Selected.Strings = (
            'FLGBUSCA'#9'9'#9'Seleciona'
            'NOME'#9'60'#9'NOME'
            'NUMDOCUMENTO'#9'18'#9'CPF')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Anchors = [akLeft, akTop, akRight, akBottom]
          DataSource = dsBuscaDados
          KeyOptions = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          ReadOnly = True
          TabOrder = 1
          TitleAlignment = taCenter
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 2
          TitleButtons = False
          OnDblClick = dbgIsencaoDblClick
          OnKeyDown = dbgIsencaoKeyDown
          IndicatorColor = icBlack
          object dbgIsencaoIButton: TwwIButton
            Left = 0
            Top = 0
            Width = 13
            Height = 22
            AllowAllUp = True
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 389
    Width = 676
    inherited tb97Fundo: TToolbar97
      Left = 426
      DockPos = 426
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 225
      DockPos = 225
      inherited ToolbarSep971: TToolbarSep97
        Left = 113
      end
      inherited bbtnConfirmar: TBitBtn
        Width = 113
        Caption = '&Processar'
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Left = 116
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 379
    Top = 266
    TargetsData = (
      1
      2
      (
        'TMemo'
        'Text'
        0)
      (
        'TRichEdit'
        'Text'
        0))
  end
  object cdsBuscaDados: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 208
    Top = 290
    Data = {
      1E0100009619E0BD0100000018000000060000000000030000001E0108494450
      4553534F410800040000000000044E4F4D450100490000000100055749445448
      020002003C000C4E554D444F43554D454E544F01004900000002000753554254
      595045020049000A00466978656443686172000557494454480200020012000F
      4D4553494E4943494F41434552544F0100490000000100055749445448020002
      0006000E4D455346494E414C41434552544F0100490000000100055749445448
      02000200280008464C4742555343410100490000000200075355425459504502
      0049000A004669786564436861720005574944544802000200010002000D4445
      4641554C545F4F5244455202008200010000000200044C434944040001000904
      0000}
  end
  object SqlBuscaDados: TCMSqlParams
    SQL.Strings = (
      'Select *'
      'from ( Select L.IDPessoa,'
      '              L.Nome,'
      '              L.NumDocumento,'
      '              L.MesPrimeiraFolha as MesInicioAcerto,'
      
        '              To_Char(To_Number(L.PrimeiroDesconto)-1) as MesFin' +
        'alAcerto,'
      '              '#39'N'#39' as FLGBusca'
      '       from ( Select Distinct M.IDPessoa,'
      '                     P.Nome,'
      '                     p.NumDocumento,'
      '                     M.MesMolestiaGrave,'
      '                     M.PrimeiroDesconto,'
      
        '                     ( Select distinct Min(To_char(h.datapagamen' +
        'to,'#39'yyyymm'#39'))'
      '                       from histrubsal h'
      
        '                       where h.datapagamento >= to_date('#39'01/01/2' +
        '009'#39','#39'dd/mm/yyyy'#39')'
      
        '                         and h.datapagamento <= to_date('#39'31/12/2' +
        '009'#39','#39'dd/mm/yyyy'#39')'
      
        '                         and idresponsavel = m.idpessoa) as MesP' +
        'rimeiraFolha'
      '              From ( Select l.idbenefirrf as idpessoa,'
      '                            pf.flgmolestiagrave,'
      
        '                            To_Char(pf.Datamolestiagrave, '#39'yyyym' +
        'm'#39') as MesMolestiaGrave,'
      
        '                            To_Char(Min(l.DataLancamento),'#39'yyyym' +
        'm'#39') as PrimeiroDesconto,'
      
        '                            To_Char(Max(l.DataLancamento),'#39'yyyym' +
        'm'#39') as UltimoDesconto'
      
        '                     from lancxinforme LI, LancIRRF L, pessoafis' +
        'ica pf'
      '                     where l.idlancirrf = li.idlancirrf'
      '                       and l.idbenefirrf = pf.idpessoa'
      '                       and pf.flgmolestiagrave = 1'
      '                       and li.idInforme in (54,55)'
      
        '                       and l.datalancamento >= to_date('#39'01/01/20' +
        '09'#39','#39'dd/mm/yyyy'#39')'
      
        '                       and l.datalancamento <= to_date('#39'31/12/20' +
        '09'#39','#39'dd/mm/yyyy'#39')'
      
        '                       and not To_Char(pf.Datamolestiagrave, '#39'yy' +
        'yymm'#39') is null'
      
        '                       and To_Char(pf.Datamolestiagrave, '#39'yyyymm' +
        #39') >= '#39'200901'#39
      '                     group by l.IdBenefIRRF,'
      '                              pf.flgmolestiagrave,'
      
        '                              To_Char(pf.Datamolestiagrave,'#39'yyyy' +
        'mm'#39')'
      
        '                     having To_Char(Min(l.DataLancamento),'#39'yyyym' +
        'm'#39') > To_Char(pf.Datamolestiagrave, '#39'yyyymm'#39')'
      '                   ) M,'
      '                   Pessoa P'
      '              where M.IDPessoa  = P.IDPessoa'
      '              Union'
      '              Select Distinct M.IDPessoa,'
      '                     P.Nome,'
      '                     p.NumDocumento,'
      '                     M.MesMolestiaGrave,'
      '                     M.PrimeiroDesconto,'
      
        '                     ( Select distinct Min(To_char(h.datapagamen' +
        'to,'#39'yyyymm'#39'))'
      '                       from histrubsal h'
      
        '                       where h.datapagamento >= to_date('#39'01/01/2' +
        '009'#39','#39'dd/mm/yyyy'#39')'
      
        '                         and h.datapagamento <= to_date('#39'31/12/2' +
        '009'#39','#39'dd/mm/yyyy'#39')'
      
        '                         and idresponsavel = m.idpessoa ) as Mes' +
        'PrimeiraFolha'
      '              From ( Select l.idbenefirrf as idpessoa,'
      '                            pf.flgmolestiagrave,'
      
        '                            To_Char(pf.Datamolestiagrave, '#39'yyyym' +
        'm'#39') as MesMolestiaGrave,'
      
        '                            To_Char(Min(l.DataLancamento),'#39'yyyym' +
        'm'#39') as PrimeiroDesconto,'
      
        '                            To_Char(Max(l.DataLancamento),'#39'yyyym' +
        'm'#39') as UltimoDesconto'
      
        '                     from lancxinforme LI, LancIRRF L, pessoafis' +
        'ica pf'
      '                     where l.idlancirrf = li.idlancirrf'
      '                       and l.idbenefirrf = pf.idpessoa'
      '                       and pf.flgmolestiagrave = 1'
      
        '                       and li.idInforme in (Select IdInformeOrig' +
        'em from InformeDePara where IdInformeDestino in (54,55))'
      
        '                       and l.datalancamento >= to_date('#39'01/01/20' +
        '09'#39','#39'dd/mm/yyyy'#39')'
      
        '                       and l.datalancamento <= to_date('#39'31/12/20' +
        '09'#39','#39'dd/mm/yyyy'#39')'
      
        '                       and not To_Char(pf.Datamolestiagrave, '#39'yy' +
        'yymm'#39') is null'
      
        '                       and To_Char(pf.Datamolestiagrave, '#39'yyyymm' +
        #39') >= '#39'200901'#39
      '                     group by l.IdBenefIRRF,'
      '                              pf.flgmolestiagrave,'
      
        '                              To_Char(pf.Datamolestiagrave,'#39'yyyy' +
        'mm'#39')'
      
        '                     having To_Char(Min(l.DataLancamento),'#39'yyyym' +
        'm'#39') > To_Char(pf.Datamolestiagrave, '#39'yyyymm'#39')'
      '                   ) M,'
      '                   Pessoa P'
      '              where M.IDPessoa  = P.IDPessoa'
      '            ) L'
      
        '       where ( (l.MesMolestiaGrave >= l.MesPrimeiraFolha and l.M' +
        'esMolestiaGrave < l.PrimeiroDesconto)   or'
      
        '               (l.MesMolestiaGrave <  l.MesPrimeiraFolha and l.M' +
        'esPrimeiraFolha < l.PrimeiroDesconto)  )'
      '     ) m'
      'where 1 = 2'
      '  and not exists ( Select 1'
      '                   from lancirrf lir,'
      '                        lancxinforme lirx,'
      '                        InformeDePara IDP'
      '                   where lir.idlancirrf = lirx.idlancirrf'
      '                     and IDP.Idinformedestino = lirx.IdInforme'
      '                     and IDP.idSituacao = 2'
      '                     and lir.idbenefirrf = m.idpessoa'
      
        '                     and to_char(lir.datalancamento,'#39'yyyymm'#39') >=' +
        ' m.MesInicioAcerto'
      
        '                     and to_char(lir.datalancamento,'#39'yyyymm'#39') <=' +
        ' m.MesFinalAcerto)'
      'Order By Nome')
    ClientDataSet = cdsBuscaDados
    Left = 124
    Top = 290
  end
  object dsBuscaDados: TwwDataSource
    DataSet = cdsBuscaDados
    Left = 39
    Top = 290
  end
  object cdsInforme: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 208
    Top = 234
  end
  object sqlInforme: TCMSqlParams
    SQL.Strings = (
      'SELECT '#39'N'#39' FLGBUSCA, IDINFORME, CODINFORME, NOMEINFORME '
      'FROM INFORME'
      'ORDER BY IDINFORME'
      ' ')
    ClientDataSet = cdsInforme
    Left = 124
    Top = 234
  end
  object dsInforme: TwwDataSource
    DataSet = cdsInforme
    Left = 39
    Top = 234
  end
end
