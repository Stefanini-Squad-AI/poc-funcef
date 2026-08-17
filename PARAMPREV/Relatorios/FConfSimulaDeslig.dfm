inherited FrmConfSimulaDeslig: TFrmConfSimulaDeslig
  Left = 188
  Top = 138
  Caption = 'Configuração de Simulação de Desligamento'
  ClientHeight = 373
  ClientWidth = 569
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 569
    Height = 287
    inherited pnlMestre: TPanel
      Width = 567
      Height = 56
      Color = clInactiveBorder
      object Label1: TLabel
        Left = 8
        Top = 8
        Width = 118
        Height = 13
        Caption = 'Plano Previdênciário'
      end
      object edtNomePlano: TEdit
        Left = 8
        Top = 24
        Width = 481
        Height = 21
        Color = clInactiveCaption
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        Text = 'edtNomePlano'
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 57
      Width = 567
      Height = 229
      Tabs.Strings = (
        'Configuração do Extrato'
        'Reservas Associadas'
        'Layout do Relatório')
      detdbGrids.Strings = (
        'dbgrdDet'
        'dbgReservaAssociada'
        '')
      inherited pgctrlDetalhe: TPageControl
        Top = 62
        Width = 469
        Height = 163
        ActivePage = tbsLayout
        inherited tbsDet: TTabSheet
          Caption = 'Configuração do Extrato'
          inherited dbgrdDet: TwwDBGrid
            Width = 461
            Height = 135
            Selected.Strings = (
              'ORDEM'#9'5'#9'Sequência'
              'IDEVENTOGERADOR'#9'5'#9'Cód.Evento'
              'NOMEEVENTO'#9'60'#9'Nome do Evento'
              'FLGRODAELEG'#9'10'#9'Roda Elegibilidade')
          end
          inherited pnlControlesDet: TPanel
            Width = 461
            Height = 135
            object Label2: TLabel
              Left = 8
              Top = 8
              Width = 90
              Height = 13
              Caption = 'Evento Gerador'
            end
            object Label3: TLabel
              Left = 8
              Top = 64
              Width = 61
              Height = 13
              Caption = 'Sequencia'
            end
            object dblcEventoGerador: TwwDBLookupCombo
              Left = 8
              Top = 24
              Width = 401
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'60'#9'Nome dado ao Evento Gerador'#9'F')
              DataField = 'IDEVENTOGERADOR'
              DataSource = dsDet
              LookupTable = qryEventos
              LookupField = 'IDEVENTOGERADOR'
              Options = [loTitles]
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
              ShowMatchText = True
              OnExit = dblcEventoGeradorExit
            end
            object dbcRodaRegraEleg: TDBCheckBox
              Left = 152
              Top = 81
              Width = 264
              Height = 17
              Caption = 'Rodar a Regra de Elegibilidade do Evento'
              DataField = 'FLGRODAELEG'
              DataSource = dsDet
              TabOrder = 2
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object dbeOrdem: TwwDBEdit
              Left = 8
              Top = 80
              Width = 65
              Height = 21
              DataField = 'ORDEM'
              DataSource = dsDet
              TabOrder = 1
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
          end
        end
        object tbsDetRes: TTabSheet
          Caption = 'Reservas Associadas'
          ImageIndex = 1
          object dbgReservaAssociada: TwwDBGrid
            Left = 0
            Top = 0
            Width = 461
            Height = 135
            Selected.Strings = (
              'CODHIERARQUIA'#9'8'#9'Cód.Hierarquia'
              'NOME'#9'50'#9'Nome da Reserva Associada')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsReservaAss
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            TabOrder = 1
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            IndicatorColor = icBlack
          end
          object pnlDet2: TPanel
            Left = 0
            Top = 0
            Width = 461
            Height = 135
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object Label4: TLabel
              Left = 16
              Top = 40
              Width = 172
              Height = 13
              Caption = 'Reserva Associada ao Evento'
            end
            object dblkReservaAssoc: TwwDBLookupCombo
              Left = 16
              Top = 56
              Width = 401
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'60'#9'Nome da Reserva'#9'F'
                'CODHIERARQUIA'#9'8'#9'Cód.Hierarquia'#9'F')
              DataField = 'IDTIPORESERVA'
              DataSource = dsReservaAss
              LookupTable = qryReservas
              LookupField = 'IDTIPORESERVA'
              Options = [loTitles]
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
              ShowMatchText = True
              OnCloseUp = dblkReservaAssocCloseUp
            end
          end
        end
        object tbsLayout: TTabSheet
          Caption = 'Layout do Relatório'
          ImageIndex = 2
          OnShow = tbsLayoutShow
          object pnlLayout: TPanel
            Left = 0
            Top = 0
            Width = 461
            Height = 135
            Align = alClient
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 0
            object pnlBotao: TPanel
              Left = 362
              Top = 0
              Width = 99
              Height = 135
              Align = alRight
              TabOrder = 0
              object btnDesenho: TBitBtn
                Left = 1
                Top = 0
                Width = 97
                Height = 134
                Caption = '&Desenho'
                TabOrder = 0
                OnClick = btnDesenhoClick
                Glyph.Data = {
                  1E040000424D1E04000000000000760000002800000030000000270000000100
                  040000000000A803000000000000000000001000000010000000000000000000
                  8000008000000080800080000000800080008080000080808000C0C0C0000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                  8888888888888888888888888888888888888888888888888888888888888888
                  8888888888888888888888888888888888888888888888888888888888888888
                  8888888888888888888888888888888888888888888888888888888888888888
                  8777777777777777888888888888888888888880000000000000000000000007
                  888888888888888888888880FBFBFBFBFBFBFBFBFBFBFB078888888888888888
                  88888880B0BFBFB0BFBFB0BFBFB0BF07888888888888888888888880F0FB0BF0
                  FB0BF0FB0BF0FB07888888888888888888888880000000000000000000000008
                  88888888888888888888888880EEEEEEEEEEEEE0788888888888888888888888
                  8888888880EEEEEEEEEEEE078888888888888888888888888888888880EE0000
                  0EEEE07F8F8F8F8888888888888888888888888880EE0870EEEE07F8F8F8F8F8
                  88888888888888888888888880EE080EEEE0077F8F8F8F888888888888888888
                  8888888880EE00EEEE0770007788888888888888888888888888888880EE0EEE
                  E07887F70077888888888888888888888888888880EEEEEE078887FF77077788
                  88888888888888888888888880EEEEE08888887FF70088778888888888888888
                  8888888880EEEE088888887FF033087778888888888888888888888880EEE088
                  88888880F003307778888888888888888888888880EE0888888888880BB03307
                  78778888888888888888888880E088888888888880BB03307888888888888888
                  888888888008888888888888880BB03308777777787888888888888880888888
                  888888888880BB0330F888888877888888888888888888888888888888880BB0
                  3308877777777788888888888888888888888888888880BB0330888777777777
                  8888888888888888888888888888880BB0330888877777777888888888888888
                  8888888888888880BB0330888880000008888888888888888888888888888888
                  0BB03308888880008888888888888888888888888888888880BB006088888888
                  88888888888888888888888888888888880B0E00088888888888888888888888
                  88888888888888888880E0870088888888888888888888888888888888888888
                  88880F887088888888888888888888888888888888888888888880F808888888
                  8888888888888888888888888888888888888800888888888888888888888888
                  8888888888888888888888888888888888888888888888888888888888888888
                  8888888888888888888888888888888888888888888888888888888888888888
                  8888}
                Layout = blGlyphTop
              end
            end
            object memLog: TRichEdit
              Left = 0
              Top = 0
              Width = 362
              Height = 135
              Align = alClient
              Color = clBtnFace
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Courier New'
              Font.Style = []
              Lines.Strings = (
                '****** DESCRIÇÃO DAS COLUNAS DO RELATÓRIO ******'
                ''
                'NOMEPARTICIPANTE    - Nome do Participante Previdenciário'
                'DATANASC            - Data de Nascimento do Participante'
                'IDPLANOPREV         - Identificador do Plano Previdenciário'
                'NOMEPLANO           - Nome do Plano Previdenciário'
                'MATRICULA           - Matrícula do Participante na Patrocinadora'
                'IDPESSJUR           - Identificador da Patrocinadora'
                
                  'DATADEMISSAO        - Data da Demissão do Participante da Patroc' +
                  'inadora'
                'NOMEPATRO           - Nome da Patrocinadora'
                
                  'INSCRICAODATA       - Data da Inscrição do Participante no Plano' +
                  ' Previdenciário'
                
                  'INSCRICAONUMERO     - Número de Inscrição do Participante no Pla' +
                  'no Previdenciário'
                'IDSIMULADESLIG      - Identificador da Simulação'
                
                  'ORDEM               - Número de Ordem de Apresentação no Relatór' +
                  'io'
                
                  'NOMEEVENTO          - Nome do Evento Gerador a ser apresentado n' +
                  'a Simulação.'
                'IDEVENTOGERADOR     - Identificador do Evento Gerador'
                'DESCRICAO           - Descrição do Evento Gerador'
                'VALOR               - Valor Calculado do Evento Gerador'
                'DATACALCULO         - Data em que foi Efetuado o Cálculo'
                'TEMPOCONTRIBTOTAL   - Tempo Total de Contribuição'
                'TEMPOCONTRIBANOS    - Tempo de Contribuição em Anos'
                'TEMPOCONTRIBMESES   - Tempo de Contribuição em Meses'
                'TEMPOCONTRIBDIAS    - Tempo de Contribuição em Dias'
                '')
              ParentFont = False
              ReadOnly = True
              ScrollBars = ssBoth
              TabOrder = 1
              WordWrap = False
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 559
        Height = 38
        inherited tb97BotoesDetalhe: TToolbar97
          inherited sbtnInsDet: TToolbarButton97
            Top = 3
          end
          inherited sbtnAltDet: TToolbarButton97
            Top = 3
          end
          inherited sbtnExcluiDet: TToolbarButton97
            Top = 3
          end
        end
        object ToolWindow971: TToolWindow97
          Left = 79
          Top = 0
          Caption = 'ToolWindow971'
          ClientAreaHeight = 32
          ClientAreaWidth = 477
          DockPos = 80
          TabOrder = 1
          object edtNomeEvento: TEdit
            Left = 0
            Top = 0
            Width = 476
            Height = 28
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -16
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
          end
        end
      end
      inherited Dock974: TDock97
        Left = 473
        Top = 62
        Height = 163
      end
    end
  end
  inherited Dock972: TDock97
    Width = 569
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 334
    Width = 569
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      1
      (
        'TRichEdit'
        'Text'
        0))
  end
  inherited dsDet: TwwDataSource
    DataSet = qryDet
    Left = 167
    Top = 98
  end
  inherited ds: TwwDataSource
    Left = 106
    Top = 98
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update PLANPREV'
      'set'
      '  NOME = :NOME'
      'where'
      '  IDPLANOPREV = :OLD_IDPLANOPREV')
    InsertSQL.Strings = (
      'insert into PLANPREV'
      '  (NOME)'
      'values'
      '  (:NOME)')
    DeleteSQL.Strings = (
      'delete from PLANPREV'
      'where'
      '  IDPLANOPREV = :OLD_IDPLANOPREV')
    Left = 106
    Top = 143
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Planos Previdenciários Cadastrados'
    Colunas.Strings = (
      'PLANPREV.IDPLANOPREV'
      'PLANPREV.NOME')
    TipodeDado.Strings = (
      'N'
      'C')
    Descricao.Strings = (
      'Código (ID) do Plano'
      'Nome do Plano Previdenciário')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'PLANPREV')
    CamposChave.Strings = (
      'PLANPREV.IDPLANOPREV')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '50')
    Left = 259
    Top = 2
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 388
    Top = 2
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT IDPLANOPREV, NOME'
      'FROM PLANPREV'
      'WHERE IDPLANOPREV  = :PIDPLANOPREV')
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPLANOPREV'
        ParamType = ptUnknown
      end>
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 508
    Top = 266
  end
  object qryDet: TwwQuery
    CachedUpdates = True
    BeforePost = qryDetBeforePost
    AfterScroll = qryDetAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CS.IDCFGSIMULADESLIG, CS.IDPLANOPREV, PP.NOME NOMEPLANO,'
      '       CS.IDEVENTOGERADOR, EG.NOME NOMEEVENTO, CS.FLGRODAELEG,'
      '       CS.ORDEM, CS.TEMPLATE'
      'FROM CFGSIMULADESLIG CS, PLANPREV PP, EVENTOGERADOR EG'
      'WHERE CS.IDPLANOPREV = :PIDPLANOPREV'
      '  AND CS.IDPLANOPREV = PP.IDPLANOPREV'
      '  AND CS.IDEVENTOGERADOR = EG.IDEVENTOGERADOR'
      'ORDER BY CS.ORDEM'
      ' ')
    UpdateObject = updDet
    ControlType.Strings = (
      'FLGRODAELEG;CheckBox;1;0')
    ValidateWithMask = True
    Left = 167
    Top = 58
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPLANOPREV'
        ParamType = ptUnknown
      end>
  end
  object updDet: TUpdateSQL
    ModifySQL.Strings = (
      'update CFGSIMULADESLIG'
      'set'
      '  IDPLANOPREV = :IDPLANOPREV,'
      '  IDEVENTOGERADOR = :IDEVENTOGERADOR,'
      '  ORDEM = :ORDEM,'
      '  FLGRODAELEG = :FLGRODAELEG,'
      '  TEMPLATE = :TEMPLATE '
      'where'
      '  IDCFGSIMULADESLIG = :OLD_IDCFGSIMULADESLIG and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDEVENTOGERADOR = :OLD_IDEVENTOGERADOR and'
      '  ORDEM = :OLD_ORDEM and'
      '  FLGRODAELEG = :OLD_FLGRODAELEG'
      ' ')
    InsertSQL.Strings = (
      'insert into CFGSIMULADESLIG'
      '  (IDCFGSIMULADESLIG, IDPLANOPREV, IDEVENTOGERADOR, ORDEM, '
      'FLGRODAELEG, TEMPLATE)'
      'values'
      '  (:IDCFGSIMULADESLIG, :IDPLANOPREV, :IDEVENTOGERADOR, :ORDEM, '
      ':FLGRODAELEG, :TEMPLATE)')
    DeleteSQL.Strings = (
      'delete from CFGSIMULADESLIG'
      'where'
      '  IDCFGSIMULADESLIG = :OLD_IDCFGSIMULADESLIG and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDEVENTOGERADOR = :OLD_IDEVENTOGERADOR and'
      '  ORDEM = :OLD_ORDEM and'
      '  FLGRODAELEG = :OLD_FLGRODAELEG')
    Left = 167
    Top = 143
  end
  object qryEventos: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDEVENTOGERADOR, NOME'
      'FROM EVENTOGERADOR'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 520
    Top = 1
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDEVENTOGERADOR, NOME'
      'FROM EVENTOGERADOR'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 320
    Top = 1
  end
  object qryReservas: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODHIERARQUIA, IDTIPORESERVA, NOME'
      'FROM RESERVAXPLANO RXP'
      'WHERE ANALITICOSINTETI = '#39'A'#39
      '  AND IDPLANOPREV = :PIDPLANOPREV'
      'ORDER BY CODHIERARQUIA')
    ControlType.Strings = (
      'FLGRODAELEG;CheckBox;1;0')
    ValidateWithMask = True
    Left = 458
    Top = 2
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPLANOPREV'
        ParamType = ptUnknown
      end>
  end
  object qryReservaAss: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT RP.CODHIERARQUIA, RD.IDRESERVADESLIG, RD.IDCFGSIMULADESLI' +
        'G,'
      '       RD.IDTIPORESERVA, RP.NOME, RP.IDPLANOPREV'
      'FROM RESERVADESLIG RD, RESERVAXPLANO RP'
      'WHERE RD.IDTIPORESERVA = RP.IDTIPORESERVA'
      '  AND RP.IDPLANOPREV   = :PIDPLANOPREV '
      ' '
      ' '
      ' ')
    UpdateObject = updReservaAss
    ValidateWithMask = True
    Left = 233
    Top = 58
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPLANOPREV'
        ParamType = ptUnknown
      end>
  end
  object dsReservaAss: TwwDataSource
    AutoEdit = False
    DataSet = qryReservaAss
    Left = 233
    Top = 98
  end
  object updReservaAss: TUpdateSQL
    ModifySQL.Strings = (
      'update RESERVADESLIG'
      'set'
      '  IDCFGSIMULADESLIG = :IDCFGSIMULADESLIG,'
      '  IDTIPORESERVA = :IDTIPORESERVA'
      'where'
      '  IDRESERVADESLIG = :OLD_IDRESERVADESLIG')
    InsertSQL.Strings = (
      'insert into RESERVADESLIG'
      '  (IDRESERVADESLIG, IDCFGSIMULADESLIG, IDTIPORESERVA)'
      'values'
      '  (:IDRESERVADESLIG, :IDCFGSIMULADESLIG, :IDTIPORESERVA)')
    DeleteSQL.Strings = (
      'delete from RESERVADESLIG'
      'where'
      '  IDRESERVADESLIG = :OLD_IDRESERVADESLIG')
    Left = 233
    Top = 143
  end
  object DsgnCM: TppDesigner
    Caption = 'Personalização de Relatório'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Icon.Data = {
      0000010001002020100000000000E80200001600000028000000200000004000
      0000010004000000000080020000000000000000000000000000000000000000
      000000008000008000000080800080000000800080008080000080808000C0C0
      C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
      0000000000033333300003333330000000000000003BBBBBB3003BBBBBB30000
      00000000003BBBBBB3003BBBBBB30000000000000003BBBB3003BBBBBB300000
      000000000003BBBB3003BBBBB3000000000000000003BBBB3003BBBB30000000
      000000000003BBBBB33BBBBB30000000000000000003BBBBBBBBBBB300000000
      000000000003BBBBBBBBBBB300000000000000700003BBBB333BBBBB30000000
      000000800003BBBB3003BBBBB30000000000F8F00003BBBB3003BBBBB3000000
      008F8F800003BBBB3003BBBBB3000070F8F877F80003BBBB333BBBBBB300007F
      8F00F08F003BBBBBBBBBBBBB3000007800FFF048003BBBBBBBBBBBB300000000
      FFFFF08F8003333333333330000070FFFFCCF804F07000000000000000007FFF
      CCFFFF0F8F0000000000000000007FCCFFFCCF074807000000000000000078FF
      FCCFFFF08F80700000000000000007FCCFFFCCF044F8070000000000000007FF
      FFCCFFFF0F8F8000000000000000078FCCFFFCCF07F77000000000000000007F
      FFFCCFFFF07000000000000000000078FCCFFFCCFF0700000000000000000007
      FFFFCCFFFF80000000000000000000078FCCFFFF877000000000000000000000
      7FFFFF8770000000000000000000000007FF8770000000000000000000000000
      007770000000000000000000000000000000000000000000000000000000FFFE
      0781FFFC0300FFFC0300FFFE0601FFFE0603FFFE0607FFFE0007FFFE000FFFFE
      000FFFDE0007FF0E0603FC0E0603F00E0603C0060003C0040007C004000FC002
      001F0001FFFF0001FFFF0000FFFF00007FFF80003FFF80003FFF80007FFFC001
      FFFFC000FFFFE000FFFFE001FFFFF007FFFFF81FFFFFFC7FFFFFFFFFFFFF}
    Position = poScreenCenter
    ShowComponents = [scLabel, scMemo, scRichText, scCalc, scImage, scShape, scLine, scBarCode, scTeeChart, scDBText, scDBMemo, scDBRichText, scDBCalc, scDBImage, scDBBarCode, scDBTeeChart, scRegion]
    Report = rpExtSimDeslig
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    WindowState = wsMaximized
    Left = 520
    Top = 48
  end
  object qryExtSimDeslig: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PE.NOME NOMEPARTICIPANTE, PF.DATANASC,'
      '       PP.IDPLANOPREV, PL.NOME NOMEPLANO,'
      '       EL.MATRICULA, EL.IDPESSJUR, EL.DATADEMISSAO,'
      '       PJ.NOME NOMEPATRO, PP.INSCRICAODATA,'
      '       PP.INSCRICAONUMERO, SD.IDSIMULADESLIG,'
      '       CF.ORDEM, EG.NOME NOMEEVENTO,'
      '       SD.IDEVENTOGERADOR, SD.DESCRICAO, SD.VALOR,'
      '       TO_CHAR(SD.TRGDTINCLUSAO,'#39'DD/MM/YYYY'#39') DATACALCULO,'
      '       EL.TEMPOSIMPLES TEMPOCONTRIBTOTAL,'
      '       :ANO TEMPOCONTRIBANOS,'
      '       :MES TEMPOCONTRIBMESES,'
      '       :DIA TEMPOCONTRIBDIAS'
      'FROM ELEGPATRO EL, PESSOA PE, PESSOA PJ, PESSOAFISICA PF,'
      '     PARTPREVPLAN PP, SIMULADESLIG SD, CFGSIMULADESLIG CF,'
      '     PLANPREV PL, EVENTOGERADOR EG'
      'WHERE PP.IDPESSOA        = :PIDPESSOA'
      '  AND PP.IDPESSJUR       = :PIDPESSJUR'
      '  AND PP.IDPLANOPREV     = :PIDPLANOPREV'
      '  AND PP.IDPESSOA        = EL.IDPESSOA'
      '  AND PP.IDPESSJUR       = EL.IDPESSJUR'
      '  AND PP.IDPLANOPREV     = PL.IDPLANOPREV'
      '  AND PP.FLGDESATIVADO   = 0'
      '  AND EL.IDPESSOA        = PE.IDPESSOA'
      '  AND PE.IDPESSOA        = PF.IDPESSOA'
      '  AND EL.IDPESSJUR       = PJ.IDPESSOA'
      '  AND SD.IDPESSOA        = PP.IDPESSOA'
      '  AND SD.IDPESSJUR       = PP.IDPESSJUR'
      '  AND SD.IDPLANOPREV     = PP.IDPLANOPREV'
      '  AND CF.IDPLANOPREV     = SD.IDPLANOPREV'
      '  AND CF.IDEVENTOGERADOR = SD.IDEVENTOGERADOR'
      '  AND CF.IDEVENTOGERADOR = EG.IDEVENTOGERADOR'
      'ORDER BY CF.ORDEM, SD.DESCRICAO'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 418
    Top = 48
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'MES'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'DIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPLANOPREV'
        ParamType = ptUnknown
      end>
  end
  object dsExtSimDeslig: TwwDataSource
    DataSet = qryExtSimDeslig
    Left = 418
    Top = 64
  end
  object ppExtSimDeslig: TppBDEPipeline
    DataSource = dsExtSimDeslig
    UserName = 'ExtSimDeslig'
    Left = 418
    Top = 80
    object ppExtSimDesligppField1: TppField
      FieldAlias = 'NOMEPARTICIPANTE'
      FieldName = 'NOMEPARTICIPANTE'
      FieldLength = 60
      DisplayWidth = 60
      Position = 0
    end
    object ppExtSimDesligppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPLANOPREV'
      FieldName = 'IDPLANOPREV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 1
    end
    object ppExtSimDesligppField3: TppField
      FieldAlias = 'NOMEPLANO'
      FieldName = 'NOMEPLANO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 2
    end
    object ppExtSimDesligppField4: TppField
      FieldAlias = 'MATRICULA'
      FieldName = 'MATRICULA'
      FieldLength = 13
      DisplayWidth = 13
      Position = 3
    end
    object ppExtSimDesligppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPESSJUR'
      FieldName = 'IDPESSJUR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 4
    end
    object ppExtSimDesligppField6: TppField
      FieldAlias = 'NOMEPATRO'
      FieldName = 'NOMEPATRO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 5
    end
    object ppExtSimDesligppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'INSCRICAONUMERO'
      FieldName = 'INSCRICAONUMERO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object ppExtSimDesligppField8: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDSIMULADESLIG'
      FieldName = 'IDSIMULADESLIG'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 7
    end
    object ppExtSimDesligppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'ORDEM'
      FieldName = 'ORDEM'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object ppExtSimDesligppField10: TppField
      FieldAlias = 'NOMEEVENTO'
      FieldName = 'NOMEEVENTO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 9
    end
    object ppExtSimDesligppField11: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDEVENTOGERADOR'
      FieldName = 'IDEVENTOGERADOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 10
    end
    object ppExtSimDesligppField12: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 11
    end
    object ppExtSimDesligppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALOR'
      FieldName = 'VALOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
  end
  object rpExtSimDeslig: TppReport
    AutoStop = False
    DataPipeline = ppExtSimDeslig
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4 210 x 297 mm'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 520
    Top = 96
    Version = '7.04'
    mmColumnWidth = 197300
    DataPipelineName = 'ppExtSimDeslig'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 47625
      mmPrintPosition = 0
      object ppLabel24: TppLabel
        UserName = 'Label1'
        Caption = 'Demonstrativo de Desligamento'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5027
        mmLeft = 72231
        mmTop = 21696
        mmWidth = 64823
        BandType = 0
      end
      object ppDBText42: TppDBText
        UserName = 'DBText42'
        AutoSize = True
        DataField = 'NOME'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 5821
        mmLeft = 41540
        mmTop = 1323
        mmWidth = 14817
        BandType = 0
      end
      object ppDBText43: TppDBText
        UserName = 'DBText43'
        AutoSize = True
        DataField = 'RAZAOSOCIAL'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 4233
        mmLeft = 41540
        mmTop = 7938
        mmWidth = 25400
        BandType = 0
      end
      object ppDBText45: TppDBText
        UserName = 'DBText45'
        AutoSize = True
        DataField = 'LOGRADOURO'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3175
        mmLeft = 41540
        mmTop = 13229
        mmWidth = 20373
        BandType = 0
      end
      object ppLabel63: TppLabel
        UserName = 'Label63'
        Caption = 'CEP'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 41540
        mmTop = 17463
        mmWidth = 5821
        BandType = 0
      end
      object ppDBText54: TppDBText
        UserName = 'DBText54'
        AutoSize = True
        DataField = 'CEP'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        mmHeight = 3175
        mmLeft = 48683
        mmTop = 17463
        mmWidth = 5821
        BandType = 0
      end
      object ppDBImage1: TppDBImage
        UserName = 'DBImage1'
        MaintainAspectRatio = True
        Stretch = True
        DataField = 'IMAGEM'
        GraphicType = 'Bitmap'
        ParentDataPipeline = False
        mmHeight = 15346
        mmLeft = 0
        mmTop = 1058
        mmWidth = 39688
        BandType = 0
      end
      object ppLabel27: TppLabel
        UserName = 'Label2'
        Caption = 'Participante :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 794
        mmTop = 28575
        mmWidth = 15875
        BandType = 0
      end
      object ppDBText32: TppDBText
        UserName = 'DBText1'
        AutoSize = True
        DataField = 'NOMEPARTICIPANTE'
        DataPipeline = ppExtSimDeslig
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppExtSimDeslig'
        mmHeight = 3175
        mmLeft = 28575
        mmTop = 28575
        mmWidth = 29104
        BandType = 0
      end
      object ppLabel28: TppLabel
        UserName = 'Label3'
        Caption = 'No. de Inscrição :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 794
        mmTop = 32544
        mmWidth = 21167
        BandType = 0
      end
      object ppDBText33: TppDBText
        UserName = 'DBText2'
        DataField = 'INSCRICAONUMERO'
        DataPipeline = ppExtSimDeslig
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppExtSimDeslig'
        mmHeight = 3175
        mmLeft = 28575
        mmTop = 32544
        mmWidth = 17198
        BandType = 0
      end
      object ppLabel29: TppLabel
        UserName = 'Label4'
        Caption = 'Matrícula :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 83608
        mmTop = 32544
        mmWidth = 13229
        BandType = 0
      end
      object ppDBText35: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = 'MATRICULA'
        DataPipeline = ppExtSimDeslig
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppExtSimDeslig'
        mmHeight = 3175
        mmLeft = 109009
        mmTop = 32544
        mmWidth = 16404
        BandType = 0
      end
      object ppLabel33: TppLabel
        UserName = 'Label5'
        Caption = 'Patrocinadora :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 83608
        mmTop = 28575
        mmWidth = 18256
        BandType = 0
      end
      object ppDBText36: TppDBText
        UserName = 'DBText4'
        AutoSize = True
        DataField = 'NOMEPATRO'
        DataPipeline = ppExtSimDeslig
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppExtSimDeslig'
        mmHeight = 3175
        mmLeft = 109009
        mmTop = 28575
        mmWidth = 18256
        BandType = 0
      end
      object ppLabel34: TppLabel
        UserName = 'Label6'
        Caption = 'Plano Previdenciário :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 794
        mmTop = 36513
        mmWidth = 26194
        BandType = 0
      end
      object ppDBText37: TppDBText
        UserName = 'DBText5'
        AutoSize = True
        DataField = 'NOMEPLANO'
        DataPipeline = ppExtSimDeslig
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        ParentDataPipeline = False
        Transparent = True
        DataPipelineName = 'ppExtSimDeslig'
        mmHeight = 3175
        mmLeft = 28575
        mmTop = 36513
        mmWidth = 17992
        BandType = 0
      end
      object ppLine24: TppLine
        UserName = 'Line3'
        ParentWidth = True
        Style = lsDouble
        Weight = 0.75
        mmHeight = 794
        mmLeft = 0
        mmTop = 27517
        mmWidth = 197300
        BandType = 0
      end
      object ppLine4: TppLine
        UserName = 'Line5'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 794
        mmLeft = 0
        mmTop = 40746
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label9'
        Caption = 'OPÇÕES'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold, fsItalic]
        Transparent = True
        mmHeight = 4233
        mmLeft = 529
        mmTop = 42069
        mmWidth = 15081
        BandType = 0
      end
      object ppLine5: TppLine
        UserName = 'Line6'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 794
        mmLeft = 0
        mmTop = 46831
        mmWidth = 197300
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3175
      mmPrintPosition = 0
      object ppDBText2: TppDBText
        UserName = 'DBText7'
        AutoSize = True
        DataField = 'DESCRICAO'
        DataPipeline = ppExtSimDeslig
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppExtSimDeslig'
        mmHeight = 3175
        mmLeft = 1058
        mmTop = 0
        mmWidth = 16933
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText8'
        AutoSize = True
        DataField = 'VALOR'
        DataPipeline = ppExtSimDeslig
        DisplayFormat = 'R$ #,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppExtSimDeslig'
        mmHeight = 3175
        mmLeft = 187325
        mmTop = 0
        mmWidth = 9525
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine2: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 1852
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel3: TppLabel
        UserName = 'LblSistema'
        AutoSize = False
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 3175
        mmWidth = 197909
        BandType = 8
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'Calc2'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 3175
        mmWidth = 197380
        BandType = 8
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'Calc1'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 171450
        mmTop = 3175
        mmWidth = 26194
        BandType = 8
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'IDEVENTOGERADOR'
      DataPipeline = ppExtSimDeslig
      KeepTogether = True
      OutlineSettings.CreateNode = True
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      DataPipelineName = 'ppExtSimDeslig'
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 8996
        mmPrintPosition = 0
        object ppDBText1: TppDBText
          UserName = 'DBText6'
          AutoSize = True
          DataField = 'NOMEEVENTO'
          DataPipeline = ppExtSimDeslig
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppExtSimDeslig'
          mmHeight = 3704
          mmLeft = 2910
          mmTop = 4233
          mmWidth = 22490
          BandType = 3
          GroupNo = 0
        end
        object ppLine3: TppLine
          UserName = 'Line4'
          Pen.Style = psDot
          Pen.Width = 2
          ParentWidth = True
          Weight = 1.5
          mmHeight = 794
          mmLeft = 0
          mmTop = 8202
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
        object ppLine1: TppLine
          UserName = 'Line1'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 794
          mmLeft = 0
          mmTop = 1323
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
        object ppDBText4: TppDBText
          UserName = 'DBText9'
          AutoSize = True
          DataField = 'ORDEM'
          DataPipeline = ppExtSimDeslig
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          DataPipelineName = 'ppExtSimDeslig'
          mmHeight = 3704
          mmLeft = 0
          mmTop = 4233
          mmWidth = 11906
          BandType = 3
          GroupNo = 0
        end
        object ppLabel1: TppLabel
          UserName = 'Label7'
          Caption = ')'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 9
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 1588
          mmTop = 4233
          mmWidth = 1588
          BandType = 3
          GroupNo = 0
        end
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object raCodeModule1: TraCodeModule
      ProgramStream = {
        01060D54726156617250726F6772616D094368696C645479706502110B50726F
        6772616D4E616D6506095661726961626C65730B50726F6772616D5479706507
        0B747450726F63656475726506536F75726365063E70726F6365647572652056
        61726961626C65733B0D0A76617220200D0A69436F6E74203A20496E74656765
        723B0D0A626567696E0D0A0D0A656E643B0D0A0000}
    end
  end
end
