inherited FrmCadBancosxCodigosMT: TFrmCadBancosxCodigosMT
  Left = 179
  Top = 133
  Caption = 'Código de Cobrança Eletrônica'
  ClientHeight = 499
  ClientWidth = 723
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 723
    Height = 413
    inherited pnlMestre: TPanel
      Width = 721
      Height = 200
      object Label2: TLabel
        Left = 17
        Top = 63
        Width = 40
        Height = 13
        Caption = 'Código'
      end
      object Label3: TLabel
        Left = 63
        Top = 63
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object LblTipo: TLabel
        Left = 17
        Top = 21
        Width = 163
        Height = 13
        Caption = 'Tipo de Cobrança Eletrônica'
      end
      object Label1: TLabel
        Left = 17
        Top = 130
        Width = 325
        Height = 13
        Caption = 'Alterador para baixa automática da ocorrência no retorno'
      end
      object chkContabAlt: TDBCheckBox
        Left = 17
        Top = 177
        Width = 169
        Height = 17
        Caption = 'Contabilizar Alterador'
        DataField = 'FLGCONTABALTERADOR'
        DataSource = ds
        TabOrder = 0
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object dblkAlterador: TwwDBLookupCombo
        Left = 17
        Top = 148
        Width = 399
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'35'#9'DESCRICAO'
          'ACRESDECRES'#9'1'#9'ACRESDECRES')
        DataField = 'CODALTERADOR'
        DataSource = ds
        LookupTable = CdsAlteradores
        LookupField = 'CODALTERADOR'
        DropDownWidth = 400
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        OrderByDisplay = False
        AllowClearKey = True
        ShowMatchText = True
      end
      object DbIndReceb: TDBCheckBox
        Left = 17
        Top = 106
        Width = 390
        Height = 18
        Caption = 'Indica que o título foi Baixado'
        DataField = 'FLGINDICABAIXA'
        DataSource = ds
        TabOrder = 2
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object EdtDescricao: TwwDBEdit
        Left = 63
        Top = 79
        Width = 353
        Height = 21
        DataField = 'DESCRICAO'
        DataSource = ds
        TabOrder = 3
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object EdtCodigo: TwwDBEdit
        Left = 17
        Top = 79
        Width = 41
        Height = 21
        DataField = 'CODIGO'
        DataSource = ds
        TabOrder = 4
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object CmbModeloCnab: TCMDBLookupCombo
        Left = 17
        Top = 37
        Width = 270
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'60'#9'DESCRICAO'#9'F')
        DataField = 'IDMODELOSCNAB'
        DataSource = ds
        LookupTable = CdsModeloscnab
        LookupField = 'IDMODELOSCNAB'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 5
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object RgTipo: TDBRadioGroup
        Left = 299
        Top = 15
        Width = 117
        Height = 50
        Caption = ' Tipo do Arquivo '
        DataField = 'TIPO'
        DataSource = ds
        Items.Strings = (
          '&Remessa'
          'R&etorno')
        TabOrder = 6
        Values.Strings = (
          'R'
          'T')
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 201
      Width = 721
      Height = 211
      Tabs.Strings = (
        'Códigos de Liquidação/Baixa')
      inherited pgctrlDetalhe: TPageControl
        Width = 623
        Height = 152
        inherited tbsDet: TTabSheet
          inherited dbgrdDet: TwwDBGrid [0]
            Width = 615
            Height = 124
            Selected.Strings = (
              'CODIGOLIQ'#9'10'#9'Coód Liq./Baixa'
              'DESCCODLIQ'#9'30'#9'Descrição'
              
                'DESPORTFORMA'#9'50'#9'Contas Caixas X Forma Pagamento /Recebimento (RE' +
                'TORNO)'
              'RECPAG'#9'1'#9'Rec/Pag'
              'FLOATFORMAPAG'#9'10'#9'Float')
          end
          inherited pnlControlesDet: TPanel [1]
            Width = 615
            Height = 124
            object Label4: TLabel
              Left = 13
              Top = 17
              Width = 89
              Height = 13
              Caption = 'Cod. Liq./Baixa'
            end
            object Label5: TLabel
              Left = 122
              Top = 17
              Width = 58
              Height = 13
              Caption = 'Descrição'
            end
            object Label6: TLabel
              Left = 15
              Top = 60
              Width = 52
              Height = 13
              Caption = 'Rec/Pag'
            end
            object Label7: TLabel
              Left = 122
              Top = 60
              Width = 355
              Height = 13
              Caption = 'Contas Caixas X Forma Pagamento /Recebimento (RETORNO)'
            end
            object wwDBEdit1: TwwDBEdit
              Left = 12
              Top = 32
              Width = 89
              Height = 21
              DataField = 'CODIGOLIQ'
              DataSource = dsDet
              TabOrder = 0
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object wwDBEdit2: TwwDBEdit
              Left = 120
              Top = 32
              Width = 481
              Height = 21
              DataField = 'DESCCODLIQ'
              DataSource = dsDet
              TabOrder = 1
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object wwDBEdit3: TwwDBEdit
              Left = 15
              Top = 75
              Width = 51
              Height = 21
              Color = clSilver
              DataField = 'RECPAG'
              DataSource = dsDet
              ReadOnly = True
              TabOrder = 2
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dblkPortForma: TwwDBLookupCombo
              Left = 120
              Top = 75
              Width = 481
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESPORTFORMA'#9'50'#9'DESPORTFORMA'#9'F')
              DataField = 'CODPORTFORMA'
              DataSource = dsDet
              LookupTable = cdsPortadorForma
              LookupField = 'CODPORTFORMA'
              TabOrder = 3
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = False
              ShowMatchText = True
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 713
      end
      inherited Dock974: TDock97
        Left = 627
        Height = 152
      end
    end
  end
  inherited Dock972: TDock97
    Width = 723
  end
  inherited Dock971: TDock97
    Top = 460
    Width = 723
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 306
    Top = 65535
  end
  inherited ds: TwwDataSource
    Left = 366
    Top = 7
  end
  inherited ImlPadrao: TImageList
    Left = 440
    Top = 95
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 256
    Top = 7
  end
  inherited Cds: TCMClientDataSet
    Active = True
    Left = 332
    Top = 7
    Data = {
      970100009619E0BD01000000180000000900000000000300000097010D494443
      4F4449474F53434E414208000400000000000D49444D4F44454C4F53434E4142
      0800040000000000065245435041470100490000000200075355425459504502
      0049000A0046697865644368617200055749445448020002000100045449504F
      01004900000002000753554254595045020049000A0046697865644368617200
      05574944544802000200010006434F4449474F01004900000002000753554254
      595045020049000A004669786564436861720005574944544802000200020009
      44455343524943414F0100490000000100055749445448020002003C000E464C
      47494E4449434142414958410100490000000200075355425459504502004900
      0A00466978656443686172000557494454480200020001000C434F44414C5445
      5241444F52080004000000000012464C47434F4E544142414C54455241444F52
      01004900000002000753554254595045020049000A0046697865644368617200
      0557494454480200020001000100044C4349440400010009080000}
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'MODELOSCNAB.DESCRICAO'
      'CODIGOSCNAB.CODIGO'
      'CODIGOSCNAB.DESCRICAO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Modelo CNAB'
      'Código'
      'Descrição')
    SensivelACaixa.Strings = (
      'S'
      'N'
      'N')
    Tabelas.Strings = (
      'CODIGOSCNAB'
      'MODELOSCNAB')
    CamposChave.Strings = (
      'CODIGOSCNAB.IDCODIGOSCNAB')
    Filtro.Strings = (
      'CODIGOSCNAB.IDMODELOSCNAB = MODELOSCNAB.IDMODELOSCNAB'
      'CODIGOSCNAB.RECPAG = MODELOSCNAB.RECPAG')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '60'
      '2'
      '60')
    Left = 426
    Top = 17
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 444
  end
  inherited dsDet: TwwDataSource
    DataSet = CdsDet
    Left = 510
    Top = 407
  end
  object CdsModeloscnab: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 80
    Top = 31
  end
  object CdsAlteradores: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 213
    Top = 43
  end
  object SqlAlteradores: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  CODALTERADOR,'
      '  DESCRICAO,'
      '  ACRESDECRES,'
      '  PLACONTA,'
      '  CODCENTROCUSTO,'
      '  CONVERTE,'
      '  FLGCALCULAIMPOSTO'
      'FROM'
      '   TIPOALTERADOR'
      'WHERE'
      '   (RECPAG = :RECPAG)  AND'
      '   (IDPESSOA = :IDPESSOA)'
      'ORDER BY'
      '    DESCRICAO'
      ' ')
    ClientDataSet = CdsAlteradores
    Left = 149
    Top = 43
  end
  object CdsDet: TCMClientDataSet
    Aggregates = <>
    IndexFieldNames = 'IDCODIGOSCNAB;IDMODELOSCNAB;RECPAG'
    MasterFields = 'IDCODIGOSCNAB;IDMODELOSCNAB;RECPAG'
    MasterSource = ds
    PacketRecords = 0
    Params = <>
    Left = 553
    Top = 408
  end
  object CMSqlParams1: TCMSqlParams
    SQL.Strings = (
      'select * from CODIGOSCNAB where 1=2')
    ClientDataSet = Cds
    Left = 417
    Top = 224
  end
  object CMSqlParams2: TCMSqlParams
    SQL.Strings = (
      'SELECT CL.*, PF.DESCRICAO AS DESPORTFORMA FROM '
      
        'CODLIQBAIXACNAB CL, MODELOSCNAB MC, CODIGOSCNAB CC, PORTADORFORM' +
        'A PF'
      'WHERE MC.IDMODELOSCNAB = CL.IDMODELOSCNAB AND'
      '      CC.IDMODELOSCNAB = MC.IDMODELOSCNAB AND'
      '      CC.IDCODIGOSCNAB = CL.IDCODIGOSCNAB AND'
      '      MC.RECPAG = CC.RECPAG AND'
      '      CC.RECPAG = CL.RECPAG AND '
      '      PF.CODPORTFORMA(+) = CL.CODPORTFORMA'
      'ORDER BY CL.CODIGOLIQ')
    ClientDataSet = CdsDet
    Left = 409
    Top = 272
  end
  object sSqlPortadorForma: TCMSqlParams
    SQL.Strings = (
      
        'SELECT CODPORTFORMA, DESCRICAO AS DESPORTFORMA, RECPAG FROM PORT' +
        'ADORFORMA'
      'WHERE RECPAG = :RECPAG')
    ClientDataSet = cdsPortadorForma
    Left = 558
    Top = 272
  end
  object cdsPortadorForma: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 553
    Top = 222
  end
end
