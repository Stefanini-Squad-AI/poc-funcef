inherited frmParamCCP: TfrmParamCCP
  Left = 336
  Top = 219
  Caption = 'Parâmetros do Sistema de Controle de Cobranças e Pagamentos'
  ClientHeight = 238
  ClientWidth = 526
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 526
    Height = 199
    object pgctrlParam: TPageControl
      Left = 1
      Top = 1
      Width = 524
      Height = 197
      ActivePage = tbsGeral
      Align = alClient
      TabOrder = 0
      object tbsGeral: TTabSheet
        Caption = 'Gerais'
        object Panel1: TPanel
          Left = 0
          Top = 0
          Width = 516
          Height = 169
          Align = alClient
          BevelOuter = bvLowered
          TabOrder = 0
          object GroupBox1: TGroupBox
            Left = 17
            Top = 15
            Width = 217
            Height = 72
            Caption = ' Cobranças de Envio Obrigatório '
            TabOrder = 0
            object chkPrevObrigaEnvio: TDBCheckBox
              Left = 20
              Top = 17
              Width = 112
              Height = 17
              Caption = 'Previdenciárias'
              DataField = 'FLGPREVOBRIGAENV'
              DataSource = ds
              TabOrder = 0
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object chkAssistObrigaEnvio: TDBCheckBox
              Left = 20
              Top = 34
              Width = 112
              Height = 17
              Caption = 'Assistenciais'
              DataField = 'FLGASSISTOBRIGAE'
              DataSource = ds
              TabOrder = 1
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object chkEmprestObrigaEnvio: TDBCheckBox
              Left = 20
              Top = 51
              Width = 112
              Height = 17
              Caption = 'Empréstimo'
              DataField = 'FLGEMPRESTOBRIGA'
              DataSource = ds
              TabOrder = 2
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
          end
          object grbEmprestimo: TGroupBox
            Left = 16
            Top = 105
            Width = 218
            Height = 49
            Caption = '  Cobranças de Empréstimo  '
            TabOrder = 1
            object dbcAgrupar: TDBCheckBox
              Left = 21
              Top = 20
              Width = 169
              Height = 17
              Caption = 'Agrupar na maior parcela'
              DataField = 'FLGAGRUPPARCEMP'
              DataSource = ds
              TabOrder = 0
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
          end
        end
      end
      object tbsOperacional: TTabSheet
        Caption = 'Operacional'
        object Panel2: TPanel
          Left = 0
          Top = 0
          Width = 516
          Height = 169
          Align = alClient
          BevelOuter = bvLowered
          TabOrder = 0
          object GroupBox3: TGroupBox
            Left = 9
            Top = 15
            Width = 217
            Height = 82
            Caption = 'Transações em Lote'
            TabOrder = 0
            object Label3: TLabel
              Left = 9
              Top = 24
              Width = 186
              Height = 13
              Caption = 'Tamanho da Faixa de Gravação '
            end
            object dbedTamFaixa: TwwDBEdit
              Left = 9
              Top = 42
              Width = 121
              Height = 21
              DataField = 'TAMFAIXA'
              DataSource = ds
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
          end
        end
      end
      object TabSheet1: TTabSheet
        Caption = 'Lay-Out'
        ImageIndex = 2
        object dbrgrpLayOutReceb: TDBRadioGroup
          Left = 18
          Top = 30
          Width = 475
          Height = 105
          Caption = ' Lay-Out de Recebimento  - Para cada Patrocinadora (Plano) '
          DataField = 'FLGLAYOUTRECEB'
          DataSource = ds
          Items.Strings = (
            
              'Utilizar o mesmo lay-out para Previdenciário, Empréstimo e Assis' +
              'tencial'
            
              'Utilizar lay-outs diferentes para Previdenciário, Empréstimo e A' +
              'ssistencial')
          TabOrder = 0
          Values.Strings = (
            '0'
            '1')
        end
      end
      object tbsPath: TTabSheet
        Caption = 'Path Autorizado'
        ImageIndex = 3
        object GroupBox4: TGroupBox
          Left = 0
          Top = 0
          Width = 516
          Height = 169
          Align = alClient
          Caption = '  Informe o Caminho  '
          TabOrder = 0
          object Label4: TLabel
            Left = 2
            Top = 15
            Width = 512
            Height = 57
            Align = alTop
            AutoSize = False
            Caption = 
              'Informe o caminho de localização dos arquivos a serem importados' +
              '/enviados. O preenchimento deste campo obrigará a operação a ser' +
              ' realizada sempre nesta localização. Ao deixar o campo em branco' +
              ' permitirá ao usuário a escolha em qualquer pasta.'
            WordWrap = True
          end
          object Label5: TLabel
            Left = 8
            Top = 72
            Width = 139
            Height = 13
            Caption = 'Local para Recebimento'
          end
          object Label6: TLabel
            Left = 8
            Top = 120
            Width = 97
            Height = 13
            Caption = 'Local para Envio'
          end
          object dbPathRec: TwwDBEdit
            Left = 9
            Top = 88
            Width = 440
            Height = 21
            DataField = 'PATHAUTORREC'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object btnPathRec: TBitBtn
            Left = 451
            Top = 88
            Width = 40
            Height = 22
            TabOrder = 0
            OnClick = btnPathRecClick
            Glyph.Data = {
              E6050000424DE605000000000000360400002800000018000000120000000100
              080000000000B0010000C30E0000C30E00000001000000000000000000007B00
              0000FF000000007B00007B7B000000FF0000FFFF0000007B7B007B7B7B00BDBD
              BD0000FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00090909090909
              0909090909090909090909090909090909090909090909090909090909090909
              0909090909090909090909090909090909090909090909090909090909090909
              0909090909090900000000000000000000000909090909090909090909090900
              0003030303030303030300090909090909090909090909000500030303030303
              0303030009090909090909090909090005050003030303030303030300090909
              0909090909090900050505000303030303030303030009090909090909090900
              0505050500000000000000000000090909090909090909000505050505050505
              0500090909090909090909090909090005050505050505050500090909090909
              0909090909090900050505000000000000000909090909090909090909090909
              0000000909090909090909020202090909090909090909090909090909090909
              0909090902020909090909090909090909090909090909020909090209020909
              0909090909090909090909090909090902020209090909090909090909090909
              0909090909090909090909090909090909090909090909090909090909090909
              09090909090909090909}
          end
          object dbPathEnv: TwwDBEdit
            Left = 9
            Top = 136
            Width = 440
            Height = 21
            DataField = 'PATHAUTORENV'
            DataSource = ds
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object btnPathEnv: TBitBtn
            Left = 451
            Top = 136
            Width = 40
            Height = 22
            TabOrder = 3
            OnClick = btnPathEnvClick
            Glyph.Data = {
              E6050000424DE605000000000000360400002800000018000000120000000100
              080000000000B0010000C30E0000C30E00000001000000000000000000007B00
              0000FF000000007B00007B7B000000FF0000FFFF0000007B7B007B7B7B00BDBD
              BD0000FFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00090909090909
              0909090909090909090909090909090909090909090909090909090909090909
              0909090909090909090909090909090909090909090909090909090909090909
              0909090909090900000000000000000000000909090909090909090909090900
              0003030303030303030300090909090909090909090909000500030303030303
              0303030009090909090909090909090005050003030303030303030300090909
              0909090909090900050505000303030303030303030009090909090909090900
              0505050500000000000000000000090909090909090909000505050505050505
              0500090909090909090909090909090005050505050505050500090909090909
              0909090909090900050505000000000000000909090909090909090909090909
              0000000909090909090909020202090909090909090909090909090909090909
              0909090902020909090909090909090909090909090909020909090209020909
              0909090909090909090909090909090902020209090909090909090909090909
              0909090909090909090909090909090909090909090909090909090909090909
              09090909090909090909}
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 199
    Width = 526
    inherited tb97Fundo: TToolbar97
      Left = 354
      DockPos = 358
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 185
      DockPos = 189
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 515
    Top = 129
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object ds: TwwDataSource
    AutoEdit = False
    DataSet = qryParam
    Left = 266
    Top = 85
  end
  object qryramo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDRAMOFORNECEDOR,DESCRAMOFORNECEDOR'
      'FROM RAMOFORNECEDOR')
    ValidateWithMask = True
    Left = 294
    Top = 161
  end
  object qrytipocliente: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDTIPOCLIENTE,DESCRICAO'
      'FROM TIPOCLIENTE')
    ValidateWithMask = True
    Left = 263
    Top = 161
  end
  object qryParam: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    RequestLive = True
    SQL.Strings = (
      'SELECT FLGPREVOBRIGAENV,  FLGASSISTOBRIGAE,'
      '       FLGEMPRESTOBRIGA, TAMFAIXA, '
      '       FLGAGRUPPARCEMP, FLGLAYOUTRECEB,'
      '       PATHAUTORREC, PATHAUTORENV'
      'FROM PARAMCCP'
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = upd
    ValidateWithMask = True
    Left = 383
    Top = 45
  end
  object msBuscaRubrica: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'PROVDESC.DESCRICAO'
      'PROVDESC.IDPROVENTO')
    TipodeDado.Strings = (
      'C'
      'N')
    Descricao.Strings = (
      'Descrição do Provento'
      'Código do Provento')
    Tabelas.Strings = (
      'PROVDESC')
    CamposChave.Strings = (
      'PROVDESC.IDPROVENTO')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '130'
      '10')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 518
    Top = 171
  end
  object upd: TUpdateSQL
    ModifySQL.Strings = (
      'update PARAMCCP'
      'set'
      '  FLGPREVOBRIGAENV = :FLGPREVOBRIGAENV,'
      '  FLGASSISTOBRIGAE = :FLGASSISTOBRIGAE,'
      '  FLGEMPRESTOBRIGA = :FLGEMPRESTOBRIGA,'
      '  TAMFAIXA = :TAMFAIXA,'
      '  FLGAGRUPPARCEMP = :FLGAGRUPPARCEMP,'
      '  FLGLAYOUTRECEB = :FLGLAYOUTRECEB,'
      '  PATHAUTORREC = :PATHAUTORREC,'
      '  PATHAUTORENV = :PATHAUTORENV')
    InsertSQL.Strings = (
      'insert into PARAMCCP'
      '  (FLGPREVOBRIGAENV, FLGASSISTOBRIGAE, FLGEMPRESTOBRIGA,'
      '   TAMFAIXA, FLGAGRUPPARCEMP, FLGLAYOUTRECEB, PATHAUTORREC,'
      '   PATHAUTORENV)'
      'values'
      '  (:FLGPREVOBRIGAENV, :FLGASSISTOBRIGAE, :FLGEMPRESTOBRIGA,'
      '   :TAMFAIXA, :FLGAGRUPPARCEMP, :FLGLAYOUTRECEB, :PATHAUTORREC, '
      '   :PATHAUTORENV)'
      ' ')
    DeleteSQL.Strings = (
      'delete from PARAMCCP')
    Left = 437
    Top = 32
  end
  object pdlPath: TProcuraDirDlg
    Caption = 'Informe o Path'
    Directory = 
      #0#0#0#0#0#0#0#0#24#0#0#0'Ü(N'#7'´&$'#8'l'#0#0#0'IDRGVALORTOT'#28#0#0#0'/'#0#0#0#0#0#0#0#29#0#0#0'NOMEREGRA'#9'60' +
      #9'Regra de NegóciH'#0#0#0#39#0#0#0#0#0#0#0#0#0#0#0'HÁË'#1'˜'#8#0#0#0#0#0#0#0#0#0#0#0#0#0#0'd'#16#0#0'7'#0#0#0'Ì4'#2'@' +
      #0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0#0'¨wz'#7'¨wz'#7'H'#8#0#0'IDREGRA'#0 +
      #24#0#0#0#31#0#0#0'Ì,'#2'@'#0#0#0#0#0#0#0#0#0#0#0#0'´'#39'À'#0#28#0#0#0'ÌÁË'#1'ÌÁË'#1#20#8#0#0#0#0#0#0#0#0#0#0#24#0#0#0'¨øÍ'#1'à(Ã'#0 +
      #28#0#0#0
    Folder = foCustom
    Options = [bfStatusText]
    ShowPath = True
    Left = 461
    Top = 137
  end
end
