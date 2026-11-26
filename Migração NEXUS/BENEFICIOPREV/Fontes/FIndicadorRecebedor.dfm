inherited frmIndicadorRecebedor: TfrmIndicadorRecebedor
  Left = 286
  Top = 107
  HelpContext = 160101
  Caption = 'Indicação de Recebedor'
  ClientHeight = 467
  ClientWidth = 911
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 911
    Height = 381
    inherited pnlMestre: TPanel
      Width = 909
      Height = 63
      object lblParticipante: TLabel
        Left = 8
        Top = 9
        Width = 69
        Height = 13
        Caption = 'Participante'
      end
      object dbTNome: TDBText
        Left = 95
        Top = 9
        Width = 47
        Height = 13
        AutoSize = True
        DataField = 'NOME'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lblPatro: TLabel
        Left = 8
        Top = 41
        Width = 80
        Height = 13
        Caption = 'Patrocinadora'
      end
      object dbTPatro: TDBText
        Left = 96
        Top = 41
        Width = 44
        Height = 13
        AutoSize = True
        DataField = 'NOMEPATRO'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lblPlanoPrev: TLabel
        Left = 490
        Top = 9
        Width = 118
        Height = 13
        Caption = 'Plano Previdenciário'
      end
      object dbTPlano: TDBText
        Left = 618
        Top = 9
        Width = 46
        Height = 13
        AutoSize = True
        DataField = 'NOMEPLANO'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lblMatricula: TLabel
        Left = 292
        Top = 41
        Width = 55
        Height = 13
        Caption = 'Matrícula'
      end
      object dbTMatricula: TDBText
        Left = 356
        Top = 41
        Width = 62
        Height = 13
        AutoSize = True
        DataField = 'MATRICULA'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lblInscricao: TLabel
        Left = 490
        Top = 41
        Width = 71
        Height = 13
        Caption = 'Inscrição Nº'
      end
      object dbTInscricao: TDBText
        Left = 570
        Top = 41
        Width = 62
        Height = 13
        AutoSize = True
        DataField = 'INSCRICAONUMERO'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 290
        Top = 9
        Width = 24
        Height = 13
        Caption = 'CPF'
      end
      object DBText1: TDBText
        Left = 322
        Top = 9
        Width = 42
        Height = 13
        AutoSize = True
        DataField = 'NUMDOCUMENTOFORMATADO'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 64
      Width = 909
      Height = 316
      Tabs.Strings = (
        'Benefícios')
      inherited pgctrlDetalhe: TPageControl
        Width = 811
        Height = 257
        inherited tbsDet: TTabSheet
          inherited dbgrdDet: TwwDBGrid
            Width = 803
            Height = 229
            Selected.Strings = (
              'BENEFICIO'#9'40'#9'Benefício'
              'CPFRECEBEDORFORMATADO'#9'14'#9'CPF'
              'NOMERECEBEDOR'#9'40'#9'Recebedor'
              'DATAFIMRECEB'#9'12'#9'Data Limite')
          end
          inherited pnlControlesDet: TPanel
            Width = 803
            Height = 229
            object grpResponsavel: TGroupBox
              Left = 4
              Top = 1
              Width = 586
              Height = 105
              Caption = ' Responsável'
              TabOrder = 1
              object Label32: TLabel
                Left = 149
                Top = 15
                Width = 128
                Height = 13
                Caption = 'Nome do Responsável'
              end
              object Label3: TLabel
                Left = 12
                Top = 58
                Width = 121
                Height = 13
                Caption = 'Tipo de Responsável'
              end
              object Label10: TLabel
                Left = 400
                Top = 57
                Width = 182
                Height = 13
                Caption = 'Data Limite para o Responsável'
              end
              object sbResponsavel: TSpeedButton
                Left = 530
                Top = 29
                Width = 25
                Height = 25
                Hint = 'Seleciona Recebedor já Cadastrado'
                Flat = True
                Glyph.Data = {
                  76010000424D7601000000000000760000002800000020000000100000000100
                  0400000000000001000000000000000000001000000010000000000000000000
                  800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                  333333333333333333FF33333333333330003FF3FFFFF3333777003000003333
                  300077F777773F333777E00BFBFB033333337773333F7F33333FE0BFBF000333
                  330077F3337773F33377E0FBFBFBF033330077F3333FF7FFF377E0BFBF000000
                  333377F3337777773F3FE0FBFBFBFBFB039977F33FFFFFFF7377E0BF00000000
                  339977FF777777773377000BFB03333333337773FF733333333F333000333333
                  3300333777333333337733333333333333003333333333333377333333333333
                  333333333333333333FF33333333333330003333333333333777333333333333
                  3000333333333333377733333333333333333333333333333333}
                NumGlyphs = 2
                ParentShowHint = False
                ShowHint = True
                OnClick = sbResponsavelClick
              end
              object sbNovoResponsavel: TSpeedButton
                Left = 557
                Top = 29
                Width = 25
                Height = 25
                Hint = 'Cadastra Novo Recebedor'
                Flat = True
                Glyph.Data = {
                  76010000424D7601000000000000760000002800000020000000100000000100
                  0400000000000001000000000000000000001000000010000000000000000000
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
                ParentShowHint = False
                ShowHint = True
                OnClick = sbNovoResponsavelClick
              end
              object Label1: TLabel
                Left = 16
                Top = 15
                Width = 24
                Height = 13
                Caption = 'CPF'
              end
              object DbLkcTipoResponsavel: TCMDBLookupCombo
                Left = 12
                Top = 74
                Width = 377
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCRICAO'#9'60'#9'Tipo de Recebedor'#9'F'
                  'CODTIPORECEBEDOR'#9'5'#9'Código'#9'F')
                DataField = 'CODTIPORECEBEDOR'
                DataSource = dsDet
                LookupTable = qryTipoRecebedor
                LookupField = 'CODTIPORECEBEDOR'
                Options = [loTitles]
                Style = csDropDownList
                ParentFont = False
                TabOrder = 0
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = True
                ShowMatchText = True
              end
              object dtLimiteRecebedor: TCMDateTimePicker
                Left = 400
                Top = 73
                Width = 121
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                DataField = 'DATAFIMRECEB'
                DataSource = dsDet
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
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ShowButton = True
                TabOrder = 1
              end
              object dbeResponsavel: TDBEdit
                Left = 149
                Top = 31
                Width = 377
                Height = 21
                TabStop = False
                Color = clBtnFace
                DataField = 'NOMERESPONSAVEL'
                DataSource = dsDet
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 2
              end
              object dbeCPFResponsavel: TDBEdit
                Left = 16
                Top = 30
                Width = 121
                Height = 21
                Color = clBtnFace
                DataField = 'CPFRESPONSAVELFORMATADO'
                DataSource = dsDet
                TabOrder = 3
              end
            end
            object grpbxResp: TGroupBox
              Left = 4
              Top = 107
              Width = 586
              Height = 119
              Caption = ' Recebedor '
              TabOrder = 0
              object Label9: TLabel
                Left = 176
                Top = 36
                Width = 117
                Height = 13
                Caption = 'Nome do Recebedor'
              end
              object Label2: TLabel
                Left = 16
                Top = 36
                Width = 90
                Height = 13
                Caption = 'CPF Recebedor'
              end
              object dbeRecebedor: TDBEdit
                Left = 176
                Top = 50
                Width = 403
                Height = 21
                TabStop = False
                Color = clBtnFace
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 2
              end
              object rdbProprio: TRadioButton
                Left = 10
                Top = 16
                Width = 102
                Height = 17
                Caption = 'É o próprio'
                TabOrder = 0
                OnClick = rdbProprioClick
              end
              object rdbOutro: TRadioButton
                Left = 132
                Top = 16
                Width = 102
                Height = 17
                Caption = 'Outra pessoa'
                TabOrder = 1
                OnClick = rdbProprioClick
              end
              object dbeCpfRecebedor: TDBEdit
                Left = 15
                Top = 50
                Width = 138
                Height = 21
                TabStop = False
                Color = clBtnFace
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 3
              end
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 901
        object edPaiDetalhe: TEdit
          Left = 85
          Top = 4
          Width = 508
          Height = 21
          BorderStyle = bsNone
          Color = clGray
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindow
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
      end
      inherited Dock974: TDock97
        Left = 815
        Height = 257
      end
    end
  end
  inherited Dock972: TDock97
    Width = 911
  end
  inherited Dock971: TDock97
    Top = 428
    Width = 911
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 264
    Top = 10
  end
  inherited dsDet: TwwDataSource
    DataSet = qryDet
    Left = 499
    Top = 340
  end
  inherited ds: TwwDataSource
    Left = 394
    Top = 10
  end
  inherited upd: TUpdateSQL
    Left = 362
    Top = 10
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'EL.MATRICULA'
      'P.NUMDOCUMENTO'
      'P.NOME'
      'PD.NOME'
      'PP.INSCRICAONUMERO'
      'PL.NOME'
      'PT.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'N'
      'C'
      'C'
      '')
    Descricao.Strings = (
      'Matrícula'
      'CPF'
      'Titular'
      'Dependente'
      'Inscrição Nº'
      'Plano Previdenciário'
      'Patrocinadora')
    SensivelACaixa.Strings = (
      'S'
      'S'
      'N'
      'S'
      'S'
      'S'
      'N')
    Tabelas.Strings = (
      'PESSOA P'
      'PESSOA PT'
      'PESSOA PD'
      'ELEGPATRO EL'
      'PLANPREV PL'
      'PARTPREVPLAN PP'
      'DEPENTIT DT'
      'PLANPREVPATRO PPP')
    CamposChave.Strings = (
      'PP.IDPESSOA'
      'PP.IDPESSJUR'
      'PP.IDPLANOPREV'
      'PP.SEQPROPOSTA'
      'DT.IDPESSOA')
    Filtro.Strings = (
      'EL.IDPESSOA = PP.IDPESSOA    '
      'EL.IDPESSJUR = PP.IDPESSJUR'
      'PP.SEQPROPOSTA = 1'
      'PP.IDPESSJUR = PPP.IDPESSJUR'
      'PP.IDPLANOPREV = PPP.IDPLANOPREV'
      'PPP.IDPLANOPREV = PL.IDPLANOPREV'
      'EL.IDPESSOA = P.IDPESSOA'
      'EL.IDPESSJUR = PT.IDPESSOA'
      'EL.IDPESSOA = DT.IDTITULAR(+)'
      'DT.IDPESSOA = PD.IDPESSOA'
      'PP.FLGDESATIVADO = 0')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '15'
      '11'
      '60'
      '60'
      '15'
      '60'
      '60')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    LookupSQL.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 427
    Top = 10
  end
  inherited ImlPadrao: TImageList
    Left = 297
    Top = 10
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 196
    Top = 90
  end
  inherited qry: TwwQuery
    Tag = 5
    SQL.Strings = (
      'SELECT P.NOME,P.NUMDOCUMENTO,'
      
        '  SUBSTR(P.NUMDOCUMENTO,1,3)||'#39'.'#39'||SUBSTR(P.NUMDOCUMENTO,4,3)||'#39 +
        '.'#39'||  SUBSTR(P.NUMDOCUMENTO,7,3)||'#39'-'#39'||  SUBSTR(P.NUMDOCUMENTO,1' +
        '0,2) AS NUMDOCUMENTOFORMATADO,'
      '              PT.NOME AS NOMEPATRO, '
      '              PL.NOME AS NOMEPLANO,'
      '              EL.MATRICULA,       '
      '              PP.INSCRICAONUMERO,   '
      '              PP.IDPESSJUR,         '
      '              PP.IDPLANOPREV,'
      '              PP.IDPESSOA,        '
      '              PP.SEQPROPOSTA,       '
      '              SP.FLGINTERNO,      '
      '              PP.INSCRICAODATA,    '
      '              PP.IDSITPART,         '
      '              PF.DATANASC,'
      
        '              DECODE(SP.FLGINTERNO, '#39'MA'#39', PP.SALMANTIDO, PP.SALP' +
        'ARTICIPACAO) AS SALARIO'
      'FROM    PESSOA P, '
      '              PESSOA PT, '
      '              PESSOAFISICA PF, '
      '              PLANPREV PL, '
      '              PARTPREVPLAN PP,'
      '              ELEGPATRO EL,'
      '              SITPART SP'
      'WHERE     (PP.IDPESSJUR     = :IDPESSJUR)'
      'AND       (PP.IDPLANOPREV   = :IDPLANOPREV)'
      'AND       (PP.IDPESSOA      = :IDPESSOA)'
      'AND       (PP.SEQPROPOSTA   = :SEQPROPOSTA)'
      'AND       (PP.IDPLANOPREV   = PL.IDPLANOPREV)'
      'AND       (PP.IDPESSOA      = P.IDPESSOA)'
      'AND       (PP.IDPESSJUR     = PT.IDPESSOA)'
      'AND       (PP.IDPESSJUR     = EL.IDPESSJUR)'
      'AND       (PP.IDPESSOA      = EL.IDPESSOA)'
      'AND       (PP.IDSITPART     = SP.IDSITPART)'
      'AND       (EL.IDPESSOA      = PF.IDPESSOA)'
      ''
      ' '
      ' '
      ' ')
    Left = 257
    Top = 114
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'SEQPROPOSTA'
        ParamType = ptUnknown
      end>
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 532
    Top = 340
  end
  object qryDet: TwwQuery
    Tag = 5
    CachedUpdates = True
    AfterScroll = qryDetAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      ''
      ''
      '  BTP.IDRESPONSAVEL,'
      '  PREC.NOME  AS NOMERECEBEDOR,'
      '  PREC.NUMDOCUMENTO AS CPFRECEBEDOR,'
      
        '  SUBSTR(PREC.NUMDOCUMENTO,1,3)||'#39'.'#39'||SUBSTR(PREC.NUMDOCUMENTO,4' +
        ',3)||'#39'.'#39'||  SUBSTR(PREC.NUMDOCUMENTO,7,3)||'#39'-'#39'||  SUBSTR(PREC.NU' +
        'MDOCUMENTO,10,2) AS CPFRECEBEDORFORMATADO,'
      '  BTP.IDRESPONNAOREC,'
      '  PRESP.NOME AS NOMERESPONSAVEL,'
      '  PRESP.NUMDOCUMENTO AS CPFRESPONSAVEL,'
      
        '  SUBSTR(PRESP.NUMDOCUMENTO,1,3)||'#39'.'#39'||SUBSTR(PRESP.NUMDOCUMENTO' +
        ',4,3)||'#39'.'#39'||  SUBSTR(PRESP.NUMDOCUMENTO,7,3)||'#39'-'#39'|| SUBSTR(PRESP' +
        '.NUMDOCUMENTO,10,2) AS CPFRESPONSAVELFORMATADO,'
      '  PTIT.NOME AS NOMETITULAR,'
      '  PTIT.NUMDOCUMENTO AS CPFTITULAR,'
      
        '  SUBSTR(PTIT.NUMDOCUMENTO,1,3)||'#39'.'#39'||SUBSTR(PTIT.NUMDOCUMENTO,4' +
        ',3)||'#39'.'#39'||  SUBSTR(PTIT.NUMDOCUMENTO,7,3)||'#39'-'#39'||  SUBSTR(PTIT.NU' +
        'MDOCUMENTO,10,2) AS CPFTITULARFORMATADO,'
      '  PDEP.NOME AS NOMEDEPENDENTE,'
      '  PDEP.IDPESSOA AS IDDEPENDENTE,'
      ''
      '  D.IDTITULAR, D.IDPESSOA,'
      ''
      '  BTP.IDPESSJUR,        BTP.IDPLANOPREV,'
      '  BTP.IDBENEFICIO,      BTP.SEQPROPOSTA,      BTP.IDDEPENRESPON,'
      '  BTP.IDNUCLEOFAMILIAR, BTP.PRIORIDADE,     BTP.PERCENTUAL,'
      '  BTP.CODTIPORECEBEDOR, BTP.DATAFIMRECEB,'
      ''
      '  B.NOME AS BENEFICIO,'
      '  PREC.NOME AS RESPONSAVEL,'
      '  TP.DESCRICAO AS TIPORESPONSAVEL,'
      '  BP.IDREGRABENEFICIA'
      'FROM'
      '  PESSOA PREC,'
      '  PESSOA PRESP,'
      '  PESSOA PTIT,'
      '  PESSOA PDEP,'
      '  BENEFPLANPREV BP,'
      '  BFCIARIOTITPLAN BTP,'
      '  PARTPREVPLAN PPP,'
      '  BENEFICIO B,'
      '  DEPENTIT D,'
      '  TIPORECEBEDOR TP'
      'WHERE   BTP.IDTITULAR     = :IDTITULAR'
      'AND     PTIT.IDPESSOA     = BTP.IDTITULAR'
      'AND     BTP.SEQPROPOSTA   = 1'
      'AND     BTP.IDPESSJUR     = PPP.IDPESSJUR'
      'AND     BTP.IDPLANOORIGEM   = PPP.IDPLANOPREV'
      'AND     BTP.IDTITULAR     = PPP.IDPESSOA'
      'AND     BTP.SEQPROPOSTA   = PPP.SEQPROPOSTA'
      'AND     BTP.IDPESSOA      = D.IDPESSOA'
      'AND     BTP.IDPESSOA      = PDEP.IDPESSOA'
      'AND     BTP.IDTITULAR     = D.IDTITULAR'
      'AND     BTP.IDBENEFICIO   = B.IDBENEFICIO'
      'AND     BTP.CODTIPORECEBEDOR = TP.CODTIPORECEBEDOR(+)'
      'AND     BTP.IDRESPONSAVEL = PREC.IDPESSOA(+)'
      'AND     BTP.IDRESPONNAOREC = PRESP.IDPESSOA(+)'
      'AND     BTP.IDPLANOPREV   = BP.IDPLANOPREV'
      'AND     BTP.IDBENEFICIO   = BP.IDBENEFICIO'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = updDet
    ValidateWithMask = True
    Left = 304
    Top = 116
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end>
  end
  object updDet: TUpdateSQL
    ModifySQL.Strings = (
      'update BFCIARIOTITPLAN'
      'set'
      '  IDRESPONSAVEL = :IDRESPONSAVEL,'
      '  DATAFIMRECEB  = :DATAFIMRECEB,'
      '  CODTIPORECEBEDOR = :CODTIPORECEBEDOR,'
      '  IDRESPONNAOREC = :IDRESPONNAOREC'
      'where'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDBENEFICIO = :OLD_IDBENEFICIO and'
      '  SEQPROPOSTA = :OLD_SEQPROPOSTA'
      ''
      '')
    InsertSQL.Strings = (
      'insert into BFCIARIOTITPLAN'
      
        '  (IDRESPONSAVEL, DATAFIMRECEB, CODTIPORECEBEDOR, IDRESPONNAOREC' +
        ')'
      'values'
      
        '  (:IDRESPONSAVEL, :DATAFIMRECEB, :CODTIPORECEBEDOR, :IDRESPONNA' +
        'OREC)'
      ' '
      ' '
      ' ')
    DeleteSQL.Strings = (
      'delete from BFCIARIOTITPLAN'
      'where'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDBENEFICIO = :OLD_IDBENEFICIO and'
      '  SEQPROPOSTA = :OLD_SEQPROPOSTA')
    Left = 344
    Top = 116
  end
  object qryTipoRecebedor: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODTIPORECEBEDOR,'
      '        DESCRICAO'
      'FROM TIPORECEBEDOR'
      'ORDER BY DESCRICAO')
    Left = 467
    Top = 340
  end
  object MSResp: TMontaSelect
    Template.IdConsulta = 0
    Colunas.Strings = (
      'PESSOA.NOME'
      'PESSOA.NUMDOCUMENTO')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Nome'
      'CPF')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'RESPONSAVEL')
    CamposChave.Strings = (
      'PESSOA.IDPESSOA'
      'RESPONSAVEL.IDRESPONSAVEL'
      'PESSOA.NOME'
      'PESSOA.NUMDOCUMENTO'
      
        'SUBSTR(PESSOA.NUMDOCUMENTO,1,3)||'#39'.'#39'||SUBSTR(PESSOA.NUMDOCUMENTO' +
        ',4,3)||'#39'.'#39'||  SUBSTR(PESSOA.NUMDOCUMENTO,7,3)||'#39'-'#39'||  SUBSTR(PES' +
        'SOA.NUMDOCUMENTO,9,2) AS NUMDOCUMENTOFORMATADO')
    Filtro.Strings = (
      'PESSOA.IDPESSOA = RESPONSAVEL.IDRESPONSAVEL'
      'RESPONSAVEL.FLGADMPREV = 1')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '60'
      '10')
    OperComparador.Strings = (
      '0'
      '0')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    LookupSQL.Strings = (
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      '')
    Left = 488
    Top = 2
  end
  object QryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 529
    Top = 11
  end
  object dsDep: TwwDataSource
    AutoEdit = False
    DataSet = qryDep
    Left = 612
    Top = 12
  end
  object qryDep: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.NOME,'
      '       P.IDPESSOA,'
      '       P.NUMDOCUMENTO,'
      '       D.IDTITULAR,'
      '       DP.DESCRICAO AS TIPODEPENDENCIA,'
      '       D.NUMSEQUENCIA,'
      '       D.FLGCONTAIMPOSTOR,'
      '       D.FLGCONTASALARIOF,'
      '       DECODE(BF.IDSITBENEFICIO, NULL, 0,'
      '                                    3, 0,'
      '                                    5, 0,'
      '                                    6, 0,'
      '                                    7, 0,'
      '                                    8, 0,'
      '                                    1, 1,'
      '                                    2, 1,'
      '                                    4, 1 ) AS FLGBENEFICIARIO,'
      '       DECODE(PF.ESTCIVIL, '#39'S'#39', '#39'Solteiro'#39','
      '                           '#39'C'#39', '#39'Casado'#39','
      '                           '#39'D'#39', '#39'Divorciado(a)'#39','
      '                           '#39'E'#39', '#39'Desquitado(a)'#39','
      '                           '#39'J'#39', '#39'Separado(a) Judicial'#39','
      '                           '#39'V'#39', '#39'Viúvo(a)'#39','
      '                           '#39'O'#39', '#39'Outros'#39')  AS DESCESTCIVIL,'
      '       D.FLGDESIGNADO,'
      '       D.FLGDEPLEGAL,'
      '       D.IDDEPENDENCIA,'
      '       D.MATRICULA,'
      '       PF.DATANASC,'
      '       PF.DATAMORTE,'
      '       PF.NOMEPAI,'
      '       PF.NOMEMAE,'
      '       PF.SEXO,'
      '       PF.FLGMOLESTIAGRAVE,'
      '       PF.DATAMOLESTIAGRAVE ,'
      '       PF.FLGISENTOIRRF,'
      '       SIT.DESCRICAO AS SITUACAODEPEN,'
      '       0 AS FLGELEGIVEL  '
      
        'FROM   PESSOA P, PESSOAFISICA PF, SITDEPENDENTE SIT, DEPEN DP, D' +
        'EPENDENTE DEP, DEPENTIT D, BENEFBFCIARIO BF'
      'WHERE  D.IDTITULAR     = :IDTITULAR'
      'AND    D.IDDEPENDENCIA <> '#39'PRP'#39
      'AND    D.IDPESSOA      = P.IDPESSOA'
      'AND    D.IDDEPENDENCIA = DP.IDDEPENDENCIA'
      'AND    BF.IDTITULAR(+) = D.IDTITULAR'
      'AND    BF.IDPESSOA(+)  = D.IDPESSOA'
      'AND    PF.IDPESSOA     = D.IDPESSOA'
      'AND    DEP.IDPESSOA    = D.IDPESSOA'
      'AND    DEP.IDSITDEPENDENTE = SIT.IDSITDEPENDENTE(+)'
      'ORDER BY D.NUMSEQUENCIA'
      ''
      ' '
      ' '
      ' ')
    UpdateObject = updDep
    ControlType.Strings = (
      'FLGCONTAIMPOSTOR;CheckBox;1;0'
      'FLGCONTASALARIOF;CheckBox;1;0'
      'FLGBENEFICIARIO;CheckBox;1;0'
      'FLGDESIGNADO;CheckBox;1;0'
      'FLGDEPLEGAL;CheckBox;1;0'
      'FLGISENTOIRRF;CheckBox;1;0'
      'FLGMOLESTIAGRAVE;CheckBox;1;0'
      'FLGELEGIVEL;CheckBox;1;0')
    ValidateWithMask = True
    Left = 579
    Top = 12
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end>
  end
  object qryRecebedor: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDRESPONSAVEL, FLGADMPREV, FLGIMOBILIARIO, FLGATIVOFIXO'
      'FROM   RESPONSAVEL'
      'WHERE  IDRESPONSAVEL = :IDRESPONSAVEL')
    UpdateObject = updRecebedor
    ValidateWithMask = True
    Left = 643
    Top = 64
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDRESPONSAVEL'
        ParamType = ptUnknown
      end>
  end
  object updRecebedor: TUpdateSQL
    ModifySQL.Strings = (
      'update RESPONSAVEL'
      'set'
      '  FLGADMPREV = :FLGADMPREV,'
      '  FLGIMOBILIARIO = :FLGIMOBILIARIO,'
      '  FLGATIVOFIXO = :FLGATIVOFIXO'
      'where'
      '  IDRESPONSAVEL = :OLD_IDRESPONSAVEL')
    InsertSQL.Strings = (
      'insert into RESPONSAVEL'
      '  (IDRESPONSAVEL, FLGADMPREV, FLGIMOBILIARIO, FLGATIVOFIXO)'
      'values'
      '  (:IDRESPONSAVEL, :FLGADMPREV, :FLGIMOBILIARIO, :FLGATIVOFIXO)')
    DeleteSQL.Strings = (
      'delete from RESPONSAVEL'
      'where'
      '  IDRESPONSAVEL = :OLD_IDRESPONSAVEL')
    Left = 643
    Top = 96
  end
  object dsRecebedor: TwwDataSource
    AutoEdit = False
    DataSet = qryRecebedor
    Left = 644
    Top = 128
  end
  object qryBeneficio: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  B.IDBENEFICIO,'
      '  B.NOME'
      ''
      'FROM'
      '  BENEFICIO B,'
      '  BENEFPLANPREV BPP'
      '  '
      'WHERE'
      '  BPP.IDPLANOPREV = :IDPLANOPREV   AND'
      '  BPP.IDBENEFICIO = B.IDBENEFICIO  AND'
      '  B.FLGDESTBENEF <> '#39'P'#39
      ''
      'ORDER BY '
      '   B.NOME'
      '')
    ValidateWithMask = True
    Left = 600
    Top = 114
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end>
  end
  object updDep: TUpdateSQL
    ModifySQL.Strings = (
      'update PESSOA'
      'set'
      '  IDGRUPO = :IDGRUPO,'
      '  IDIMAGEM = :IDIMAGEM,'
      '  IDDOCUMENTO = :IDDOCUMENTO,'
      '  NOME = :NOME,'
      '  TIPO = :TIPO,'
      '  RAZAOSOCIAL = :RAZAOSOCIAL,'
      '  FLGUSUARIO = :FLGUSUARIO,'
      '  FLGCONTATO = :FLGCONTATO,'
      '  FLGCOTISTA = :FLGCOTISTA,'
      '  FLGCLIENTE = :FLGCLIENTE,'
      '  FLGPATROCINADORA = :FLGPATROCINADORA,'
      '  FLGADMINFUNDO = :FLGADMINFUNDO,'
      '  FLGADMINISTRADORA = :FLGADMINISTRADORA,'
      '  FLGEMPEMITETIT = :FLGEMPEMITETIT,'
      '  FLGBANCO = :FLGBANCO,'
      '  FLGBOLSA = :FLGBOLSA,'
      '  FLGAUTARQUIA = :FLGAUTARQUIA,'
      '  FLGSINDICATO = :FLGSINDICATO,'
      '  FLGOUTRO = :FLGOUTRO,'
      '  FLGRESPONSAVEL = :FLGRESPONSAVEL,'
      '  FLGTERCEIRO = :FLGTERCEIRO,'
      '  FLGFORNSERV = :FLGFORNSERV,'
      '  FLGFUNCIONARIO = :FLGFUNCIONARIO,'
      '  FLGINVALIDO = :FLGINVALIDO,'
      '  FLGCANDIDATO = :FLGCANDIDATO,'
      '  FLGESTRANGEIRO = :FLGESTRANGEIRO,'
      '  FLGGESTORFUNDO = :FLGGESTORFUNDO,'
      '  FLGAVALISTA = :FLGAVALISTA,'
      '  FLGPAGADOR = :FLGPAGADOR,'
      '  FLGPRODUTOR = :FLGPRODUTOR,'
      '  FLGAVERBADORA = :FLGAVERBADORA,'
      '  NUMDOCUMENTO = :NUMDOCUMENTO,'
      '  EMAIL = :EMAIL,'
      '  FLGAGENCIA = :FLGAGENCIA,'
      '  FLGFUNDACAO = :FLGFUNDACAO,'
      '  FLGDEPENDENTE = :FLGDEPENDENTE,'
      '  FLGELEGIVEL = :FLGELEGIVEL,'
      '  FLGHOTEL = :FLGHOTEL,'
      '  FLGVENDEDOR = :FLGVENDEDOR,'
      '  FLGAGENCIAVIAGEM = :FLGAGENCIAVIAGEM,'
      '  FLGFILIALPESSOA = :FLGFILIALPESSOA,'
      '  FLGPROPRIETARIOUH = :FLGPROPRIETARIOUH,'
      '  FLGREPRESENTANTE = :FLGREPRESENTANTE,'
      '  SEQTRANSMISSAO = :SEQTRANSMISSAO,'
      '  FLGHOSPEDE = :FLGHOSPEDE,'
      '  FLGEMISSOR = :FLGEMISSOR,'
      '  FLGINSTFIN = :FLGINSTFIN,'
      '  FLGBOLSAVALORES = :FLGBOLSAVALORES,'
      '  FLGCORRETORAVALOR = :FLGCORRETORAVALOR,'
      '  FLGGESTORCARTEIRA = :FLGGESTORCARTEIRA,'
      '  FLGCUSTODIANTE = :FLGCUSTODIANTE,'
      '  FLGBENEFPROCUH = :FLGBENEFPROCUH,'
      '  FLGCANALREP = :FLGCANALREP,'
      '  FLGLOCATARIO = :FLGLOCATARIO,'
      '  FLGADMINIMOVEL = :FLGADMINIMOVEL,'
      '  TRGDTINCLUSAO = :TRGDTINCLUSAO,'
      '  TRGUSERINCLUSAO = :TRGUSERINCLUSAO,'
      '  FLGCONCIERGE = :FLGCONCIERGE,'
      '  FLGOPERADORMANUT = :FLGOPERADORMANUT,'
      '  IDENDCORRESP = :IDENDCORRESP,'
      '  IDENDCOMERCIAL = :IDENDCOMERCIAL,'
      '  IDENDENTREGA = :IDENDENTREGA,'
      '  IDENDRESIDENCIAL = :IDENDRESIDENCIAL,'
      '  IDENDCOBRANCA = :IDENDCOBRANCA,'
      '  HOMEPAGE = :HOMEPAGE'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into PESSOA'
      
        '  (IDGRUPO, IDIMAGEM, IDDOCUMENTO, NOME, TIPO, RAZAOSOCIAL, FLGU' +
        'SUARIO, '
      
        '   FLGCONTATO, FLGCOTISTA, FLGCLIENTE, FLGPATROCINADORA, FLGADMI' +
        'NFUNDO, '
      
        '   FLGADMINISTRADORA, FLGEMPEMITETIT, FLGBANCO, FLGBOLSA, FLGAUT' +
        'ARQUIA, '
      
        '   FLGSINDICATO, FLGOUTRO, FLGRESPONSAVEL, FLGTERCEIRO, FLGFORNS' +
        'ERV, FLGFUNCIONARIO, '
      
        '   FLGINVALIDO, FLGCANDIDATO, FLGESTRANGEIRO, FLGGESTORFUNDO, FL' +
        'GAVALISTA, '
      
        '   FLGPAGADOR, FLGPRODUTOR, FLGAVERBADORA, NUMDOCUMENTO, EMAIL, ' +
        'FLGAGENCIA, '
      
        '   FLGFUNDACAO, FLGDEPENDENTE, FLGELEGIVEL, FLGHOTEL, FLGVENDEDO' +
        'R, FLGAGENCIAVIAGEM, '
      
        '   FLGFILIALPESSOA, FLGPROPRIETARIOUH, FLGREPRESENTANTE, SEQTRAN' +
        'SMISSAO, '
      
        '   FLGHOSPEDE, FLGEMISSOR, FLGINSTFIN, FLGBOLSAVALORES, FLGCORRE' +
        'TORAVALOR, '
      
        '   FLGGESTORCARTEIRA, FLGCUSTODIANTE, FLGBENEFPROCUH, FLGCANALRE' +
        'P, FLGLOCATARIO, '
      
        '   FLGADMINIMOVEL, TRGDTINCLUSAO, TRGUSERINCLUSAO, FLGCONCIERGE,' +
        ' FLGOPERADORMANUT, '
      
        '   IDENDCORRESP, IDENDCOMERCIAL, IDENDENTREGA, IDENDRESIDENCIAL,' +
        ' IDENDCOBRANCA, '
      '   HOMEPAGE)'
      'values'
      
        '  (:IDGRUPO, :IDIMAGEM, :IDDOCUMENTO, :NOME, :TIPO, :RAZAOSOCIAL' +
        ', :FLGUSUARIO, '
      
        '   :FLGCONTATO, :FLGCOTISTA, :FLGCLIENTE, :FLGPATROCINADORA, :FL' +
        'GADMINFUNDO, '
      
        '   :FLGADMINISTRADORA, :FLGEMPEMITETIT, :FLGBANCO, :FLGBOLSA, :F' +
        'LGAUTARQUIA, '
      
        '   :FLGSINDICATO, :FLGOUTRO, :FLGRESPONSAVEL, :FLGTERCEIRO, :FLG' +
        'FORNSERV, '
      
        '   :FLGFUNCIONARIO, :FLGINVALIDO, :FLGCANDIDATO, :FLGESTRANGEIRO' +
        ', :FLGGESTORFUNDO, '
      
        '   :FLGAVALISTA, :FLGPAGADOR, :FLGPRODUTOR, :FLGAVERBADORA, :NUM' +
        'DOCUMENTO, '
      
        '   :EMAIL, :FLGAGENCIA, :FLGFUNDACAO, :FLGDEPENDENTE, :FLGELEGIV' +
        'EL, :FLGHOTEL, '
      
        '   :FLGVENDEDOR, :FLGAGENCIAVIAGEM, :FLGFILIALPESSOA, :FLGPROPRI' +
        'ETARIOUH, '
      
        '   :FLGREPRESENTANTE, :SEQTRANSMISSAO, :FLGHOSPEDE, :FLGEMISSOR,' +
        ' :FLGINSTFIN, '
      
        '   :FLGBOLSAVALORES, :FLGCORRETORAVALOR, :FLGGESTORCARTEIRA, :FL' +
        'GCUSTODIANTE, '
      
        '   :FLGBENEFPROCUH, :FLGCANALREP, :FLGLOCATARIO, :FLGADMINIMOVEL' +
        ', :TRGDTINCLUSAO, '
      
        '   :TRGUSERINCLUSAO, :FLGCONCIERGE, :FLGOPERADORMANUT, :IDENDCOR' +
        'RESP, :IDENDCOMERCIAL, '
      '   :IDENDENTREGA, :IDENDRESIDENCIAL, :IDENDCOBRANCA, :HOMEPAGE)')
    DeleteSQL.Strings = (
      'delete from PESSOA'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 648
    Top = 17
  end
end
