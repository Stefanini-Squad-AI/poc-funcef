inherited FrmOpcoesExporta: TFrmOpcoesExporta
  Left = 368
  Top = 159
  BorderStyle = bsDialog
  Caption = 'Opções de Exportação'
  ClientHeight = 240
  ClientWidth = 484
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 484
    Height = 201
    object rdgTpExport: TRadioGroup
      Left = 84
      Top = 88
      Width = 299
      Height = 65
      Caption = ' Exportar para '
      Columns = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemIndex = 0
      Items.Strings = (
        'MS Excel'
        'CSV')
      ParentFont = False
      TabOrder = 0
    end
    object GroupBox1: TGroupBox
      Left = 8
      Top = 8
      Width = 465
      Height = 65
      Caption = 'Pasta do Arquivo : '
      TabOrder = 1
      object edtArquivo: TEdit
        Left = 11
        Top = 21
        Width = 403
        Height = 21
        Enabled = False
        TabOrder = 0
      end
      object bbtnSel: TBitBtn
        Left = 423
        Top = 16
        Width = 35
        Height = 31
        TabOrder = 1
        OnClick = bbtnSelClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          5555555555555555555555555555555555555555555555555555555555555555
          555555555555555555555555555555555555555FFFFFFFFFF555550000000000
          55555577777777775F55500B8B8B8B8B05555775F555555575F550F0B8B8B8B8
          B05557F75F555555575F50BF0B8B8B8B8B0557F575FFFFFFFF7F50FBF0000000
          000557F557777777777550BFBFBFBFB0555557F555555557F55550FBFBFBFBF0
          555557F555555FF7555550BFBFBF00055555575F555577755555550BFBF05555
          55555575FFF75555555555700007555555555557777555555555555555555555
          5555555555555555555555555555555555555555555555555555}
        NumGlyphs = 2
      end
    end
  end
  inherited Dock971: TDock97
    Top = 201
    Width = 484
    inherited tb97Fundo: TToolbar97
      Left = 312
      DockPos = 385
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 117
      inherited ToolbarSep971: TToolbarSep97
        Left = 107
      end
      inherited bbtnConfirmar: TBitBtn
        Width = 107
        Caption = 'Gerar Arquivo'
        OnClick = bbtnConfirmarClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333330070
          7700333333337777777733333333008088003333333377F73377333333330088
          88003333333377FFFF7733333333000000003FFFFFFF77777777000000000000
          000077777777777777770FFFFFFF0FFFFFF07F3333337F3333370FFFFFFF0FFF
          FFF07F3FF3FF7FFFFFF70F00F0080CCC9CC07F773773777777770FFFFFFFF039
          99337F3FFFF3F7F777F30F0000F0F09999937F7777373777777F0FFFFFFFF999
          99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
          99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
          93337FFFF7737777733300000033333333337777773333333333}
      end
      inherited bbtnCancelar: TBitBtn
        Left = 110
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 35
    Top = 235
    TargetsData = (
      1
      1
      (
        ''
        'Title'
        0))
  end
  object qryEmpresa: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT P.RAZAOSOCIAL, P.NUMDOCUMENTO, T.NUMERO AS TELEFONEFORMAT' +
        'ADO, '
      
        '       EN.LOGRADOURO AS ENDEREO, EN.NUMERO,  EN.COMPLEMENTO,  EN' +
        '.BAIRRO,  C.NOME AS CIDADE,  EN.CEP, '
      
        '       ES.CODESTADO AS UF, REPLACE(REPLACE(REPLACE(T.NUMERO, '#39'-'#39 +
        '), '#39'('#39'), '#39')'#39') AS TELEFONE, T.DDD , C.NUMSEED '
      
        '  FROM PESSOA P, ENDPESS EN, CIDADES C, ESTADO ES, (SELECT DISTI' +
        'NCT IDENDERECO, TIPO, NUMERO, DDD FROM TELENDPESS) T '
      ' WHERE (P.IDPESSOA = :IdPessoaProp ) AND '
      '       (EN.IDENDERECO(+) = P.IDENDCOMERCIAL) AND '
      '       (EN.IDCIDADES     = C.IDCIDADES(+)) AND '
      '       (ES.IDESTADO(+)    = C.IDESTADO) AND '
      '       (EN.IDPESSOA(+)   = P.IDPESSOA) AND '
      '       (EN.IDENDERECO = T.IDENDERECO(+)) ')
    ValidateWithMask = True
    Left = 26
    Top = 91
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IdPessoaProp'
        ParamType = ptUnknown
      end>
  end
  object AbrirDlg: TProcuraDirDlg
    Directory = 
      #0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#12'‰Ž'#7#0#0#0#0'È?ø'#7'¼‰Ž'#7#0#0#0#0'Xs¡'#8#1#1#0#0#0#0#0#0#1#0#0#0'„y“'#7 +
      'è'#28#25#7'Ì'#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0'œßì'#8#4'Îˆ'#7'˜'#0#0#0#0#0#0#0 +
      #0#0#0#0#0#0#0#0#0#0#0#0'ä‚'#23#7#0#0#0#0'Œ¢î'#8'€'#20'‰'#7't'#0#0#0'Data'#0'Aõ'#7'œ¿ü'#7'Ü5ÿ'#3'`'#0#0#0'ì'#29'þ'#3',iõ'#7#4#39'Ú'#8 +
      'ä´Ù'#8'l@ø'#7'€@ø'#7'Œß'#23#7#1#0#1#1'ÿÿÿÿ'#0#0#0#0#1#0#0#0',V‹'#7'Ôû'#22#7'('#0#0#0#0#0#0#0#20#0#0#0#23#0#0#0'Ì,'#2'@'#0#0#0#0 +
      #0#0#0#0
    Folder = foCustom
    Options = [bfStatusText]
    ShowPath = True
    Left = 415
    Top = 108
  end
end
