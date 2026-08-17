inherited frmParamFichaReg: TfrmParamFichaReg
  Left = 170
  Top = 158
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsToolWindow
  Caption = 'Ficha de Registro de Empregados'
  ClientHeight = 296
  ClientWidth = 532
  Font.Style = []
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 532
    Height = 257
    BorderWidth = 2
    object gbxEstab: TGroupBox
      Left = 14
      Top = 7
      Width = 375
      Height = 47
      Caption = 'Estabelecimento'
      TabOrder = 0
      object dblkcbEstab: TwwDBLookupCombo
        Left = 7
        Top = 16
        Width = 361
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'60'#9'Estabelecimento')
        LookupTable = qryEstab
        LookupField = 'CODIGO'
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        OnChange = dblkcbEstabChange
      end
    end
    object gbxFunc: TGroupBox
      Left = 14
      Top = 56
      Width = 503
      Height = 140
      Caption = 'Empregados'
      TabOrder = 2
      object chklstFunc: TCheckListBox
        Left = 7
        Top = 14
        Width = 354
        Height = 120
        OnClickCheck = chklstFuncClickCheck
        ItemHeight = 13
        Style = lbOwnerDrawFixed
        TabOrder = 0
        OnDrawItem = chklstFuncDrawItem
        OnKeyDown = chklstFuncKeyDown
      end
      object bbtnSelTodosTipoFolha: TBitBtn
        Left = 366
        Top = 14
        Width = 131
        Height = 25
        Caption = '   Seleciona Todos'
        TabOrder = 1
        TabStop = False
        OnClick = bbtnSelTodosTipoFolhaClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333333333333333333333333333333333333333300000
          0003333333388888888333333330FF9FFF0333333338FF7FFF8333333000F999
          FF0333333888F777FF83333330F099F99F03333338F877F77F83333000F09FFF
          9903333888F87FFF77833330F090FFFFF9933338F878FFFFF7733000F0900000
          00993888F8788888887730F090FFFFF9933338F878FFFFF7733330F090000000
          993338F87888888877333090FFFFF99333333878FFFFF7733333309000000099
          3333387888888877333330FFFFF99333333338FFFFF773333333300000009933
          3333388888887733333333333333333333333333333333333333}
        NumGlyphs = 2
        Spacing = 0
      end
      object bbtnInvSelTipoFolha: TBitBtn
        Left = 366
        Top = 41
        Width = 131
        Height = 25
        Caption = '   Inverte Seleção'
        TabOrder = 2
        TabStop = False
        OnClick = bbtnInvSelTipoFolhaClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333333333000000003333333388888888333333330FFF
          FFF0333333338FFFFFF8333000330FFFFFF0333788338FFFFFF8333033330FFF
          FFF0333833338FFFFFF8330003330FFFFFF0337783338FFFFFF8333033330FFF
          FFF0333833338FFFFFF833333333000000003333333388888888000000003333
          333388888888333333330FF9FFF0333303338FF7FFF8333383330F999FF03330
          00338F777FF833387733099F99F033330333877F77F83333833309FFF9903300
          033387FFF778338873330FFFFF99333333338FFFFF7733333333000000099333
          3333888888877333333333333333333333333333333333333333}
        NumGlyphs = 2
        Spacing = 0
      end
    end
    object gbDataRef: TGroupBox
      Left = 396
      Top = 7
      Width = 121
      Height = 47
      Caption = 'Data de Referência'
      TabOrder = 1
      object dtedDataRef: TCMDateTimePicker
        Left = 8
        Top = 16
        Width = 105
        Height = 21
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
        ShowButton = True
        TabOrder = 0
        OnChange = dtedDataRefChange
      end
    end
    object rgNomeEmpresa: TRadioGroup
      Left = 14
      Top = 200
      Width = 503
      Height = 47
      Caption = 'O Nome da Empresa no Cabeçalho da Ficha'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Já Está Pré-Impresso no Formulário'
        'Será Impresso Pelo Sistema')
      TabOrder = 3
    end
  end
  inherited Dock971: TDock97
    Top = 257
    Width = 532
    inherited tb97Fundo: TToolbar97
      Left = 266
      DockPos = 278
      inherited sep1: TToolbarSep97
        Left = 180
      end
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 80
        Top = 0
        Blank = True
        SizeHorz = 20
      end
      inherited bbtnSair: TBitBtn
        Left = 100
        TabOrder = 1
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 182
        TabOrder = 2
      end
      object btImprimir: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        Caption = ' &Imprimir'
        Default = True
        TabOrder = 0
        OnClick = btImprimirClick
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888880008
          8888888888888F7778FF8888000088888800877008888888888F7787F778FF88
          0000888800880007700888888F778F7778F778FF000088008800877007700888
          778F7787F778F778000080880088877770077087FF778887F88778F700008700
          888887777770008777888887FF888777000080888888F77777777087F8888F77
          78FF88870000878888FF888777777087F88F77888778FF8700008788FF888888
          87777087FF778888888778F7000087FF88899888888770877788888888888777
          000087888AA88888808880878FF8888888FFF8F700008877F888888FF0877888
          778FF88FF77787780000888877F87FFFFF08888888778F77788878F800008888
          88777FFFFFF088888888777FF888878F00008888888877FFFFFF008888888877
          8F888F77000088888888887FFF7788888888888878FF77880000888888888887
          7788888888888888877788880000888888888888888888888888888888888888
          0000}
        NumGlyphs = 2
        Spacing = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 38
    Top = 119
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryFunc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '  PF.IDPESSOA, PF.NOME AS EMPREGADO'
      'FROM'
      '  PESSOA PF, FUNCIONARIO F, FILIALPESSOA FP, SITFUNC S'
      'WHERE'
      '  (S.TIPOSIT         <> '#39'D'#39')        AND'
      '  (FP.IDFILIALPESSOA  = :ESTAB)     AND'
      '  (TO_CHAR(F.DATAADMISSAO,'#39'YYYY/MM'#39') = :DATAREF) AND'
      '  (FP.IDFILIALPESSOA  = F.IDESTAB)  AND'
      '  (PF.IDPESSOA        = F.IDPESSOA) AND'
      '  (F.IDSITFUNC        = S.IDSITFUNC)'
      'ORDER BY'
      '  UPPER(EMPREGADO)')
    ValidateWithMask = True
    Left = 266
    Top = 73
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ESTAB'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAREF'
        ParamType = ptUnknown
      end>
  end
  object qryEstab: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  PJ.IDPESSOA AS CODIGO, PJ.NOME'
      'FROM'
      '  PESSOA PJ, FILIALPESSOA FP'
      'WHERE'
      ''
      '  (PJ.IDGRUPO        = :EMPRESA) AND'
      '  (FP.IDFILIALPESSOA = PJ.IDPESSOA)')
    ValidateWithMask = True
    Left = 119
    Top = 73
    ParamData = <
      item
        DataType = ftInteger
        Name = 'EMPRESA'
        ParamType = ptUnknown
      end>
  end
  object qryParamRH: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  NORMALINI, NORMALFIM'
      'FROM'
      '  PARAMRH')
    ValidateWithMask = True
    Left = 40
    Top = 73
  end
  object svdlgDialogo: TOpenDialog
    DefaultExt = '*.TXT'
    FileName = 'FichaReg.TXT'
    Filter = 'Arquivos Texto|*.TXT|Todos os Arquivos|*.*'
    Options = [ofHideReadOnly, ofPathMustExist, ofNoNetworkButton]
    Title = 'Escolha a Pasta para a Geração'
    Left = 98
    Top = 119
  end
  object GImp: TGImp
    DataBaseName = 'BaseDados'
    TipoFonte = TfNormal
    MostraPrinterSetup = True
    EjetarPagina = False
    Condensado = True
    Sublinhado = False
    SaltodeLinhaCondensado = True
    RegConfigImpressora.ValueNameId = 'IdImpressora'
    RegConfigImpressora.ValueNamePrinter = 'Impressora\Porta'
    Left = 146
    Top = 119
  end
  object qryFichaReg: TwwQuery
    BeforeOpen = qryFichaRegBeforeOpen
    AfterOpen = qryFichaRegAfterOpen
    AfterScroll = qryFichaRegAfterScroll
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 325
    Top = 73
  end
  object qryAgBanc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  B.NUMBANCO, PB.NOME, A.NUMAGENCIA, A.IDPESSOA,'
      '  PA.NOME AS AGENCIA'
      'FROM'
      '  PESSOA PA, PESSOA PB, AGENCIABANCARIA A, BANCO B'
      'WHERE'
      '  (B.NUMBANCO = '#39'104'#39')       AND'
      '  (B.IDPESSOA =  A.IDBANCO)  AND'
      '  (A.IDPESSOA = PA.IDPESSOA) AND'
      '  (B.IDPESSOA = PB.IDPESSOA)'
      'ORDER BY'
      '  B.NUMBANCO, A.NUMAGENCIA')
    ValidateWithMask = True
    Left = 329
    Top = 119
  end
  object qryFilhos: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '  PF.IDPESSOA, PF.NOME AS FILHO, D.NUMSEQUENCIA,'
      '  PFIS.DATANASC AS NASCFILHO,'
      
        '  DECODE(PFIS.SEXO,'#39'M'#39','#39'Filho'#39','#39'F'#39', '#39'Filha'#39','#39'Filho(a)'#39') AS SEXOF' +
        'IL'
      'FROM'
      '  PESSOA PF, PESSOAFISICA PFIS, DEPENTIT D'
      'WHERE'
      '  (D.IDTITULAR     = :IDTITULAR)  AND'
      '  (D.IDDEPENDENCIA = '#39'FIL'#39')       AND'
      '  (D.IDPESSOA      = PF.IDPESSOA) AND'
      '  (PF.IDPESSOA     = PFIS.IDPESSOA)'
      'ORDER BY'
      '  NUMSEQUENCIA ')
    ValidateWithMask = True
    Left = 250
    Top = 129
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end>
  end
  object qryConjuge: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '  PF.IDPESSOA, PF.NOME AS CONJUGE, D.NUMSEQUENCIA'
      'FROM'
      '  PESSOA PF, DEPENTIT D'
      'WHERE'
      '  (D.IDTITULAR     = :IDTITULAR) AND'
      '  (D.IDDEPENDENCIA = '#39'COM'#39')      AND'
      '  (PF.IDPESSOA     = D.IDPESSOA)'
      'ORDER BY'
      '  NUMSEQUENCIA')
    ValidateWithMask = True
    Left = 202
    Top = 89
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end>
  end
end
