inherited frmCadTipoPDV: TfrmCadTipoPDV
  Left = 41
  Top = 65
  HelpContext = 160115
  Caption = 'Cadastro de Tipos de PDV e Manuteção com Benefício Indicado'
  ClientHeight = 432
  ClientWidth = 751
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 751
    Height = 346
    inherited pnlMestre: TPanel
      Width = 749
      Height = 68
      object Label4: TLabel
        Left = 24
        Top = 8
        Width = 94
        Height = 13
        Caption = 'Código do Plano'
      end
      object Label5: TLabel
        Left = 128
        Top = 8
        Width = 87
        Height = 13
        Caption = 'Nome do Plano'
      end
      object DBEdit2: TDBEdit
        Left = 24
        Top = 24
        Width = 97
        Height = 21
        Color = clSilver
        DataField = 'IDPLANOPREV'
        DataSource = ds
        TabOrder = 0
      end
      object DBEdit3: TDBEdit
        Left = 128
        Top = 24
        Width = 393
        Height = 21
        Color = clSilver
        DataField = 'NOME'
        DataSource = ds
        TabOrder = 1
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 69
      Width = 749
      Height = 276
      Tabs.Strings = (
        'Tipo de PDV e Manutenção com Benefício Indicado do Plano')
      inherited pgctrlDetalhe: TPageControl
        Width = 651
        Height = 217
        inherited tbsDet: TTabSheet
          Caption = 'Tipo de PDV e Manutenção com Benefício Indicado do Plano'
          inherited pnlControlesDet: TPanel [0]
            Width = 643
            Height = 189
            BevelInner = bvLowered
            object Label1: TLabel
              Left = 8
              Top = 16
              Width = 90
              Height = 13
              Caption = 'Evento Gerador'
            end
            object lblRgElegibilidade: TLabel
              Left = 8
              Top = 97
              Width = 325
              Height = 13
              Caption = 'Regra de Elegibilidade à Manutenção (apenas para PDV)'
            end
            object Label2: TLabel
              Left = 8
              Top = 56
              Width = 207
              Height = 13
              Caption = 'Regra da Data Final da Manutenção'
            end
            object lblRgResgate: TLabel
              Left = 8
              Top = 139
              Width = 279
              Height = 13
              Caption = 'Regra de Cálculo de Resgate (apenas para PDV)'
            end
            object lblPrazo: TLabel
              Left = 378
              Top = 16
              Width = 173
              Height = 13
              Caption = 'Prazo para Término do Evento'
            end
            object Label3: TLabel
              Left = 504
              Top = 40
              Width = 36
              Height = 13
              Caption = 'meses'
            end
            object dblkpcmbEvento: TwwDBLookupCombo
              Left = 8
              Top = 32
              Width = 355
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'60'#9'Evento Gerador')
              DataField = 'IDEVENTOGERADOR'
              DataSource = dsDet
              LookupTable = qryEventoGerador
              LookupField = 'IDEVENTOGERADOR'
              Options = [loTitles]
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              OnCloseUp = dblkpcmbEventoCloseUp
            end
            object dblckcmbIdRegEleg: TwwDBLookupCombo
              Left = 8
              Top = 112
              Width = 355
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOMEREGRA'#9'60'#9'Regra')
              DataField = 'IDREGRAELEGIEV'
              DataSource = dsDet
              LookupTable = qryRegra
              LookupField = 'IDREGRA'
              Options = [loTitles]
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
            object dblckcmbIdRegDataFinal: TwwDBLookupCombo
              Left = 8
              Top = 72
              Width = 355
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOMEREGRA'#9'60'#9'Regra')
              DataField = 'IDREGRADTFIMEV'
              DataSource = dsDet
              LookupTable = qryRegra
              LookupField = 'IDREGRA'
              Options = [loTitles]
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
            object dblckcmbIdRegCalcResgate: TwwDBLookupCombo
              Left = 8
              Top = 152
              Width = 355
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOMEREGRA'#9'60'#9'Regra')
              DataField = 'IDREGRARESGATE'
              DataSource = dsDet
              LookupTable = qryRegra
              LookupField = 'IDREGRA'
              Options = [loTitles]
              TabOrder = 3
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
            object DBEdit1: TDBEdit
              Left = 378
              Top = 32
              Width = 121
              Height = 21
              DataField = 'PRZMESESEVENT'
              DataSource = dsDet
              TabOrder = 4
            end
          end
          inherited dbgrdDet: TwwDBGrid [1]
            Width = 643
            Height = 189
            Selected.Strings = (
              'PRZMESESEVENT'#9'10'#9'Prazo de Término ~Evento'#9'F'
              'NOME'#9'50'#9'Nome do ~Evento'#9'F'
              'NOMEREGRAELEGIEV'#9'60'#9'Regra de ~Elegibilidade'#9'F'
              'NOMEREGRADTFIMEV'#9'40'#9'Resgate ~Dt. Final'#9'F'
              'NOMEREGRARESGATE'#9'40'#9'Regra para ~Resgate'#9'F')
            TitleLines = 2
          end
        end
      end
      inherited Dock973: TDock97
        Width = 741
      end
      inherited Dock974: TDock97
        Left = 655
        Height = 217
      end
    end
  end
  inherited Dock972: TDock97
    Width = 751
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Visible = False
      end
      inherited sbtnAlterar: TToolbarButton97
        Caption = '&Atualizar'
        Glyph.Data = {
          6E020000424D6E02000000000000760000002800000036000000120000000100
          040000000000F801000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777777777777FFFFFF777777777777777777777770077777770000007777777
          777FF888888F7777777777777777777777007777700111111077017777F88777
          77787F8777777700000077777700777701111111110011777F877FFFFF7788F8
          7777004444440770470077701119999911111177F877F88888F777F877704444
          4444400447007701119777779111117F877F8777778F77F8770444CCCCC44444
          47007701197777777111117F87F87777777877F870444C77777C444447007700
          0977777711111177888877777F8FFFF87044C777777744444700777777777779
          99999977FFFFF777788888887000C77777744444470070000007777777777778
          888887777777FFF77777777777CCCCCCC7007044444C777777000C787777F877
          7777888800000077777777777700704444C7777777044C7877778777777F87F8
          011111C77777700097007044440077777044C778777788FFFFF8778701111C77
          7777701197007044444400000444C7787FF7778888877F870111100777770119
          7700704CC4444444444C7778F88FF777777FF8770111111000001119770077C7
          7CC444444CC7777787788FFFFFF88777019911111111119777007777777CCCCC
          C777777777777888888777777977991111119977770077777777777777777777
          777777777777777777777799999977777700}
      end
      inherited sbtnApagar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 393
    Width = 751
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
  inherited dsDet: TwwDataSource
    DataSet = qryDet
    Left = 463
  end
  inherited ds: TwwDataSource
    Left = 259
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update PLANPREV'
      'set'
      '  IDPLANOPREV = :IDPLANOPREV,'
      '  NOME = :NOME'
      'where'
      '  IDPLANOPREV = :OLD_IDPLANOPREV')
    InsertSQL.Strings = (
      'insert into PLANPREV'
      '  (IDPLANOPREV, NOME)'
      'values'
      '  (:IDPLANOPREV, :NOME)')
    DeleteSQL.Strings = (
      'delete from PLANPREV'
      'where'
      '  IDPLANOPREV = :OLD_IDPLANOPREV')
    Left = 297
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Plano Previdenciário ...'
    Colunas.Strings = (
      'IDPLANOPREV'
      'NOME')
    TipodeDado.Strings = (
      'N'
      'C')
    Descricao.Strings = (
      'Código do Plano'
      'Nome do Plano')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'PLANPREV')
    CamposChave.Strings = (
      'IDPLANOPREV')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '60')
    ExibePergunta = False
    Left = 397
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 358
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT IDPLANOPREV, NOME'
      'FROM PLANPREV'
      'WHERE IDPLANOPREV = :IDPLANOPREV')
    Left = 335
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end>
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 408
    Top = 108
  end
  object qryDet: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT EV.IDEVENTOGERADOR, EV.IDPLANOPREV, EV.IDREGRAELEGIEV, EV' +
        '.IDREGRADTFIMEV,'
      '       EV.IDREGRARESGATE,  EV.PRZMESESEVENT,'
      '       EG.NOME,'
      '       R1.NOMEREGRA AS NOMEREGRAELEGIEV,'
      '       R2.NOMEREGRA AS NOMEREGRADTFIMEV,'
      '       R3.NOMEREGRA AS NOMEREGRARESGATE'
      
        'FROM   EVENTOSPLANO EV, EVENTOGERADOR EG, REGRA R1, REGRA R2, RE' +
        'GRA R3'
      'WHERE  EV.IDPLANOPREV     = :IDPLANOPREV'
      'AND    EG.IDEVENTOGERADOR = EV.IDEVENTOGERADOR'
      'AND    EV.IDREGRAELEGIEV  = R1.IDREGRA(+)'
      'AND    EV.IDREGRADTFIMEV  = R2.IDREGRA(+)'
      'AND    EV.IDREGRARESGATE  = R3.IDREGRA(+)')
    UpdateObject = updDet
    ValidateWithMask = True
    Left = 502
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end>
  end
  object updDet: TUpdateSQL
    ModifySQL.Strings = (
      'update EVENTOSPLANO'
      'set'
      '  IDREGRAELEGIEV = :IDREGRAELEGIEV,'
      '  IDREGRADTFIMEV = :IDREGRADTFIMEV,'
      '  IDREGRARESGATE = :IDREGRARESGATE,'
      '  PRZMESESEVENT = :PRZMESESEVENT'
      'where'
      '  IDEVENTOGERADOR = :OLD_IDEVENTOGERADOR and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV')
    InsertSQL.Strings = (
      'insert into EVENTOSPLANO'
      
        '  (IDEVENTOGERADOR, IDPLANOPREV, IDREGRAELEGIEV, IDREGRADTFIMEV,' +
        ' IDREGRARESGATE, '
      '   PRZMESESEVENT)'
      'values'
      
        '  (:IDEVENTOGERADOR, :IDPLANOPREV, :IDREGRAELEGIEV, :IDREGRADTFI' +
        'MEV, :IDREGRARESGATE, '
      '   :PRZMESESEVENT)')
    DeleteSQL.Strings = (
      'delete from EVENTOSPLANO'
      'where'
      '  IDEVENTOGERADOR = :OLD_IDEVENTOGERADOR and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV')
    Left = 543
    Top = 3
  end
  object qryEventoGerador: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDEVENTOGERADOR, NOME, FLGINTERNO'
      'FROM   EVENTOGERADOR'
      'WHERE  FLGINTERNO IN ('#39'PD'#39', '#39'DM'#39', '#39'DS'#39')'
      'ORDER BY NOME ')
    ValidateWithMask = True
    Left = 616
    Top = 2
  end
  object qryRegra: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDREGRA, NOMEREGRA FROM REGRA'
      'ORDER BY NOMEREGRA')
    ValidateWithMask = True
    Left = 699
    Top = 3
  end
end
