inherited RptCAFCadBem: TRptCAFCadBem
  Left = 351
  Top = 209
  Width = 212
  Height = 198
  Caption = 'Cadastro de Bens'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Cadastro de Bens'
    DataBaseName = 'BaseDados'
    Params = <
      item
        Caption = 'Bens Movimentados até'
        Controle = tcEdit
        TipodeDado = tdDate
        LookupSettings.SQL.Strings = ()
        CheckBoxSetings.ValueChecked = 'False'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = False
        Required = True
      end
      item
        Caption = 'Controle'
        Controle = tcComboBox
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        CheckBoxSetings.ValueChecked = 'False'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = (
          'Total'
          'Físico')
        ComboBoxSettings.DropDownCount = 2
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
      end
      item
        Caption = 'Classe'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT DESCRICAO, CODHIERARQ, IDCLASSEBEM'
          'FROM CLASSEDEBEM'
          'WHERE (ANASINT = '#39'A'#39')'
          'ORDER BY CODHIERARQ')
        LookupSettings.Chave = 'IDCLASSEBEM'
        LookupSettings.Display = 'DESCRICAO|CODHIERARQ'
        LookupSettings.Descricao = 'Classe|Código'
        LookupSettings.Tamanho = '50|10'
        CheckBoxSetings.ValueChecked = 'False'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
      end
      item
        Caption = 'Grupo'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT NOME, CLASSE, IDGRUPO'
          'FROM GRUPO'
          'WHERE (TIPO = '#39'A'#39')'
          'ORDER BY CLASSE')
        LookupSettings.Chave = 'IDGRUPO'
        LookupSettings.Display = 'NOME|CLASSE'
        LookupSettings.Descricao = 'Grupo|Código'
        LookupSettings.Tamanho = '50|10'
        CheckBoxSetings.ValueChecked = 'False'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
      end
      item
        Caption = 'Localização'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT NOME, IDLOCALIZACAO,CODCENTROCUSTO'
          'FROM LOCALIZACAO'
          'ORDER BY NOME')
        LookupSettings.Chave = 'IDLOCALIZACAO'
        LookupSettings.Display = 'NOME|CODCENTROCUSTO'
        LookupSettings.Descricao = 'Localização|Centro de Custo'
        LookupSettings.Tamanho = '50|10'
        CheckBoxSetings.ValueChecked = 'False'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = False
        Required = False
      end
      item
        Caption = 'Responsável'
        Controle = tcLookupCombo
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = (
          'SELECT P.NOME, R.IDRESPONSAVEL'
          'FROM PESSOA P,'
          '     RESPONSAVEL R'
          'WHERE (R.IDRESPONSAVEL = P.IDPESSOA)'
          'ORDER BY P.NOME')
        LookupSettings.Chave = 'IDRESPONSAVEL'
        LookupSettings.Display = 'NOME'
        LookupSettings.Descricao = 'Responsável'
        LookupSettings.Tamanho = '50'
        CheckBoxSetings.ValueChecked = 'False'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
      end
      item
        Caption = 'Conjunto'
        Controle = tcLookupCombo
        TipodeDado = tdString
        LookupSettings.SQL.Strings = (
          'SELECT DESCCONJUNTO, IDCONJUNTO'
          'FROM CONJUNTO'
          'ORDER BY DESCCONJUNTO')
        LookupSettings.Chave = 'IDCONJUNTO'
        LookupSettings.Display = 'DESCCONJUNTO'
        LookupSettings.Descricao = 'Conjunto'
        LookupSettings.Tamanho = '50'
        CheckBoxSetings.ValueChecked = 'False'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
      end
      item
        Caption = 'Data de Entrada Inicial'
        Controle = tcEdit
        TipodeDado = tdDate
        LookupSettings.SQL.Strings = ()
        CheckBoxSetings.ValueChecked = 'False'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = False
        Required = False
      end
      item
        Caption = 'Data de Entrada Final'
        Controle = tcEdit
        TipodeDado = tdDate
        LookupSettings.SQL.Strings = ()
        CheckBoxSetings.ValueChecked = 'False'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = False
        Required = False
      end
      item
        Caption = 'Ordenado por'
        Controle = tcRadioGroup
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
        CheckBoxSetings.ValueChecked = 'False'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = (
          'Nome'
          'Placa'
          'Grupo'
          'Responsável'
          'Localização'
          'Conjunto')
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 3
        RadioGroupSettings.ItemIndex = 0
        RadioGroupSettings.Height = 55
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = True
      end>
    Formheight = 360
    Left = 28
  end
  inherited DevRptCM: TExtraOptions
    Left = 152
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    ChangeDataBaseName = CrmRptCMChangeDataBaseName
    DataBaseName = 'BaseDados'
    Report = rpBem
    Left = 91
  end
  object qryBem: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT B.PLACA, B.DESBEM, B.DATAULTDEP, B.DATAINICIODEP, B.IDNOT' +
        'A, B.COMPLNOTA,'
      
        '       B.NUMSERIE, B.REGISTRO, B.CONTROLE, B.TAXADEP, CC.NOME AS' +
        ' DESCCCUSTO,'
      
        '       L.NOME AS DESCLOCAL, PR.NOME AS NOMERESP, G.NOME AS DESCG' +
        'RUPO,'
      
        '       C.DESCCONJUNTO, B.DTAINCLUSAO, NVL(B.VALHISTORICO,0) AS V' +
        'ALHISTORICO,'
      
        '       PF.NOME AS NOMEFORN, B.IDOPCIONAL, CB.DESCRICAO AS DESCCL' +
        'ASSE,'
      '       S.DESCSITUACAO,'
      '       ('
      '       (NVL(BEMACUM.VALBEMACUM,0) +'
      '        NVL(REAVACUM.VALREAVACUM,0) +'
      '        NVL(ACRESACUM.VALACRESACUM,0)) -'
      '       (NVL(BXBEMACUM.BXVALBEMACUM,0) +'
      '        NVL(BXREAVACUM.BXVALREAVACUM,0) +'
      '        NVL(BXACRESACUM.BXVALACRESACUM,0))) AS VALORG0,'
      ''
      '       (NVL(CMBEMACUM.VALCMBEMACUM,0) +'
      '        NVL(CMREAVACUM.VALCMREAVACUM,0) +'
      '        NVL(CMACRESACUM.VALCMACRESACUM,0) -'
      '        NVL(BXCMBEMACUM.BXVALCMBEMACUM,0) -'
      '        NVL(BXCMREAVACUM.BXVALCMREAVACUM,0) -'
      '        NVL(BXCMACRESACUM.BXVALCMACRESACUM,0)) AS CMBEM0,'
      ''
      '       (NVL(DEPBEMACUM.VALDEPBEMACUM,0) +'
      '        NVL(DEPREAVACUM.VALDEPREAVACUM,0) +'
      '        NVL(DEPACRESACUM.VALDEPACRESACUM,0) -'
      '        NVL(BXDEPBEMACUM.BXVALDEPBEMACUM,0) -'
      '        NVL(BXDEPREAVACUM.BXVALDEPREAVACUM,0) -'
      '        NVL(BXDEPACRESACUM.BXVALDEPACRESACUM,0)) AS DEPLANC0,'
      ''
      '       (NVL(CMDEPBEMACUM.VALCMDEPBEMACUM,0) +'
      '        NVL(CMDEPREAVACUM.VALCMDEPREAVACUM,0) +'
      '        NVL(CMDEPACRESACUM.VALCMDEPACRESACUM,0) -'
      '        NVL(BXCMDEPBEMACUM.BXVALCMDEPBEMACUM,0) -'
      '        NVL(BXCMDEPREAVACUM.BXVALCMDEPREAVACUM,0) -'
      '        NVL(BXCMDEPACRESACUM.BXVALCMDEPACRESACUM,0)) AS CMDEP0,'
      '       (('
      '       (NVL(BEMACUM.VALBEMACUM,0) +'
      '        NVL(REAVACUM.VALREAVACUM,0) +'
      '        NVL(ACRESACUM.VALACRESACUM,0) +'
      '        NVL(CMBEMACUM.VALCMBEMACUM,0) +'
      '        NVL(CMREAVACUM.VALCMREAVACUM,0) +'
      '        NVL(CMACRESACUM.VALCMACRESACUM,0) ) -'
      ''
      '       (NVL(DEPBEMACUM.VALDEPBEMACUM,0) +'
      '        NVL(DEPREAVACUM.VALDEPREAVACUM,0) +'
      '        NVL(DEPACRESACUM.VALDEPACRESACUM,0) +'
      '        NVL(CMDEPBEMACUM.VALCMDEPBEMACUM,0) +'
      '        NVL(CMDEPREAVACUM.VALCMDEPREAVACUM,0) +'
      '        NVL(CMDEPACRESACUM.VALCMDEPACRESACUM,0) )'
      '       ) -'
      '       ('
      '       (NVL(BXBEMACUM.BXVALBEMACUM,0) +'
      '        NVL(BXREAVACUM.BXVALREAVACUM,0) +'
      '        NVL(BXACRESACUM.BXVALACRESACUM,0) +'
      '        NVL(BXCMBEMACUM.BXVALCMBEMACUM,0) +'
      '        NVL(BXCMREAVACUM.BXVALCMREAVACUM,0) +'
      '        NVL(BXCMACRESACUM.BXVALCMACRESACUM,0) ) -'
      ''
      '       (NVL(BXDEPBEMACUM.BXVALDEPBEMACUM,0) +'
      '        NVL(BXDEPREAVACUM.BXVALDEPREAVACUM,0) +'
      '        NVL(BXDEPACRESACUM.BXVALDEPACRESACUM,0) +'
      '        NVL(BXCMDEPBEMACUM.BXVALCMDEPBEMACUM,0) +'
      '        NVL(BXCMDEPREAVACUM.BXVALCMDEPREAVACUM,0) +'
      
        '        NVL(BXCMDEPACRESACUM.BXVALCMDEPACRESACUM,0) ))) AS VALCT' +
        'B0'
      ''
      'FROM BEM         B,'
      '     GRUPO       G,'
      '     CLASSEDEBEM CB,'
      '     CONJUNTO    C,'
      '     LOCALIZACAO L,'
      '     CENTCUST    CC,'
      '     PESSOA      PR,'
      '     PESSOA      PF,'
      '     SITUACAO    S,'
      ''
      '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALBEMACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (01,41))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BEMACUM,'
      ''
      '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALREAVACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (08,32,45))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) REAVACUM,'
      ''
      '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALACRESACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (09,49))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) ACRESACUM,'
      ''
      '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALCMBEMACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (15,42))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) CMBEMACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALCMREAVACU' +
        'M'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (22,46))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) CMREAVACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALCMACRESAC' +
        'UM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (34,50))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) CMACRESACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALDEPBEMACU' +
        'M'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (14,17,43))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) DEPBEMACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALDEPREAVAC' +
        'UM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (18,33,47))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) DEPREAVACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALDEPACRESA' +
        'CUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (35,51))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) DEPACRESACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALCMDEPBEMA' +
        'CUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (21,44))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) CMDEPBEMACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALCMDEPREAV' +
        'ACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (19,48))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) CMDEPREAVACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS VALCMDEPACRE' +
        'SACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (36,52))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) CMDEPACRESACUM,'
      ''
      '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVALBEMACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 6)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXBEMACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVALREAVACU' +
        'M'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 20)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXREAVACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVALACRESAC' +
        'UM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 37)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXACRESACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVALCMBEMAC' +
        'UM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 25)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXCMBEMACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVALCMREAVA' +
        'CUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 28)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXCMREAVACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVALCMACRES' +
        'ACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 38)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXCMACRESACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVALDEPBEMA' +
        'CUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 24)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXDEPBEMACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVALDEPREAV' +
        'ACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 27)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXDEPREAVACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVALDEPACRE' +
        'SACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 39)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXDEPACRESACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVALCMDEPBE' +
        'MACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 26)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXCMDEPBEMACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVALCMDEPRE' +
        'AVACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 29)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXCMDEPREAVACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(VM.VALOFI) AS BXVALCMDEPAC' +
        'RESACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 40)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXCMDEPACRESACUM'
      ''
      
        'WHERE ((B.DATAINICIODEP <= :PDATAMOV) OR (B.DATAINICIODEP IS NUL' +
        'L))'
      '  AND (B.IDCONJUNTO     = C.IDCONJUNTO(+))'
      '  AND (B.IDGRUPO        = G.IDGRUPO(+))'
      '  AND (C.IDLOCALIZACAO  = L.IDLOCALIZACAO(+))'
      '  AND (C.IDRESPONSAVEL  = PR.IDPESSOA(+))'
      '  AND (B.IDFORNSERV     = PF.IDPESSOA(+))'
      '  AND (L.CODCENTROCUSTO = CC.CODCENTROCUSTO(+))'
      '  AND (L.IDEMPRESA      = CC.IDEMPRESA(+))'
      '  AND (B.IDCLASSEBEM    = CB.IDCLASSEBEM(+))'
      '  AND (B.IDSITUACAO     = S.IDSITUACAO(+))'
      '  AND (B.IDBEM = BEMACUM.IDBEM(+))'
      '  AND (B.IDBEM = REAVACUM.IDBEM(+))'
      '  AND (B.IDBEM = ACRESACUM.IDBEM(+))'
      '  AND (B.IDBEM = CMBEMACUM.IDBEM(+))'
      '  AND (B.IDBEM = DEPBEMACUM.IDBEM(+))'
      '  AND (B.IDBEM = CMREAVACUM.IDBEM(+))'
      '  AND (B.IDBEM = DEPREAVACUM.IDBEM(+))'
      '  AND (B.IDBEM = CMDEPBEMACUM.IDBEM(+))'
      '  AND (B.IDBEM = CMDEPREAVACUM.IDBEM(+))'
      '  AND (B.IDBEM = CMACRESACUM.IDBEM(+))'
      '  AND (B.IDBEM = DEPACRESACUM.IDBEM(+))'
      '  AND (B.IDBEM = CMDEPACRESACUM.IDBEM(+))'
      '  AND (B.IDBEM = BXBEMACUM.IDBEM(+))'
      '  AND (B.IDBEM = BXREAVACUM.IDBEM(+))'
      '  AND (B.IDBEM = BXACRESACUM.IDBEM(+))'
      '  AND (B.IDBEM = BXCMBEMACUM.IDBEM(+))'
      '  AND (B.IDBEM = BXDEPBEMACUM.IDBEM(+))'
      '  AND (B.IDBEM = BXCMREAVACUM.IDBEM(+))'
      '  AND (B.IDBEM = BXDEPREAVACUM.IDBEM(+))'
      '  AND (B.IDBEM = BXCMDEPBEMACUM.IDBEM(+))'
      '  AND (B.IDBEM = BXCMDEPREAVACUM.IDBEM(+))'
      '  AND (B.IDBEM = BXCMACRESACUM.IDBEM(+))'
      '  AND (B.IDBEM = BXDEPACRESACUM.IDBEM(+))'
      '  AND (B.IDBEM = BXCMDEPACRESACUM.IDBEM(+))'
      ''
      '')
    ValidateWithMask = True
    Left = 16
    Top = 64
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end>
    object qryBemPLACA: TFloatField
      FieldName = 'PLACA'
    end
    object qryBemDESBEM: TStringField
      FieldName = 'DESBEM'
      Size = 200
    end
    object qryBemDATAULTDEP: TDateTimeField
      FieldName = 'DATAULTDEP'
    end
    object qryBemDATAINICIODEP: TDateTimeField
      FieldName = 'DATAINICIODEP'
    end
    object qryBemIDNOTA: TStringField
      FieldName = 'IDNOTA'
      Size = 18
    end
    object qryBemCOMPLNOTA: TStringField
      FieldName = 'COMPLNOTA'
      Size = 5
    end
    object qryBemNUMSERIE: TStringField
      FieldName = 'NUMSERIE'
    end
    object qryBemREGISTRO: TStringField
      FieldName = 'REGISTRO'
      Size = 1
    end
    object qryBemCONTROLE: TStringField
      FieldName = 'CONTROLE'
      Size = 1
    end
    object qryBemTAXADEP: TFloatField
      FieldName = 'TAXADEP'
    end
    object qryBemDESCCCUSTO: TStringField
      FieldName = 'DESCCCUSTO'
      Size = 30
    end
    object qryBemDESCLOCAL: TStringField
      FieldName = 'DESCLOCAL'
      Size = 60
    end
    object qryBemNOMERESP: TStringField
      FieldName = 'NOMERESP'
      Size = 60
    end
    object qryBemDESCGRUPO: TStringField
      FieldName = 'DESCGRUPO'
      Size = 60
    end
    object qryBemDESCCONJUNTO: TStringField
      FieldName = 'DESCCONJUNTO'
      Size = 200
    end
    object qryBemDTAINCLUSAO: TDateTimeField
      FieldName = 'DTAINCLUSAO'
    end
    object qryBemVALHISTORICO: TFloatField
      FieldName = 'VALHISTORICO'
    end
    object qryBemNOMEFORN: TStringField
      FieldName = 'NOMEFORN'
      Size = 60
    end
    object qryBemIDOPCIONAL: TStringField
      FieldName = 'IDOPCIONAL'
      Size = 30
    end
    object qryBemDESCCLASSE: TStringField
      FieldName = 'DESCCLASSE'
      Size = 60
    end
    object qryBemDESCSITUACAO: TStringField
      FieldName = 'DESCSITUACAO'
      Size = 45
    end
    object qryBemVALORG0: TFloatField
      FieldName = 'VALORG0'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qryBemCMBEM0: TFloatField
      FieldName = 'CMBEM0'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qryBemDEPLANC0: TFloatField
      FieldName = 'DEPLANC0'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qryBemCMDEP0: TFloatField
      FieldName = 'CMDEP0'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
    object qryBemVALCTB0: TFloatField
      FieldName = 'VALCTB0'
      DisplayFormat = '#,0.00;(#,0.00)'
    end
  end
  object dsBem: TwwDataSource
    DataSet = qryBem
    Left = 64
    Top = 64
  end
  object ppBem: TppBDEPipeline
    DataSource = dsBem
    UserName = 'Bem'
    Left = 112
    Top = 64
  end
  object rpBem: TppReport
    AutoStop = False
    DataPipeline = ppBem
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210079
    PrinterSetup.mmPaperWidth = 297127
    PrinterSetup.PaperSize = 0
    Template.SaveTo = stDatabase
    Units = utMillimeters
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 160
    Top = 64
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 19579
      mmPrintPosition = 0
      object rpBemCabec: TppLabel
        UserName = 'rpBemCabec'
        Caption = 'Cadastro Patrimonial de Bens em '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 107686
        mmTop = 9790
        mmWidth = 68792
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'ppLabel2'
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 127265
        mmTop = 1588
        mmWidth = 29633
        BandType = 0
      end
      object rpBemLine3: TppLine
        UserName = 'rpBemLine3'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 0
        mmTop = 18256
        mmWidth = 284427
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 27517
      mmPrintPosition = 0
      object rpBemLabel1: TppLabel
        UserName = 'rpBemLabel1'
        Caption = 'Placa '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 4498
        mmWidth = 8202
        BandType = 4
      end
      object rpBemLabel2: TppLabel
        UserName = 'rpBemLabel2'
        Caption = 'Conjunto '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 121444
        mmTop = 529
        mmWidth = 14023
        BandType = 4
      end
      object rpBemDBText2: TppDBText
        UserName = 'rpBemDBText2'
        DataField = 'DESCCONJUNTO'
        DataPipeline = ppBem
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 136261
        mmTop = 529
        mmWidth = 147902
        BandType = 4
      end
      object rpBemLabel3: TppLabel
        UserName = 'rpBemLabel3'
        Caption = 'Descrição '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 35719
        mmTop = 4498
        mmWidth = 15081
        BandType = 4
      end
      object rpBemDBText3: TppDBText
        UserName = 'rpBemDBText3'
        DataField = 'DESBEM'
        DataPipeline = ppBem
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 51858
        mmTop = 4498
        mmWidth = 232569
        BandType = 4
      end
      object rpBemLabel4: TppLabel
        UserName = 'rpBemLabel4'
        Caption = 'Localização '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 8467
        mmWidth = 17463
        BandType = 4
      end
      object rpBemDBText4: TppDBText
        UserName = 'rpBemDBText4'
        DataField = 'DESCLOCAL'
        DataPipeline = ppBem
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 18256
        mmTop = 8467
        mmWidth = 65881
        BandType = 4
      end
      object rpBemLabel5: TppLabel
        UserName = 'rpBemLabel5'
        Caption = 'Responsável '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 85196
        mmTop = 8467
        mmWidth = 19579
        BandType = 4
      end
      object rpBemDBText5: TppDBText
        UserName = 'rpBemDBText5'
        DataField = 'NOMERESP'
        DataPipeline = ppBem
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 105569
        mmTop = 8467
        mmWidth = 69586
        BandType = 4
      end
      object rpBemLabel6: TppLabel
        UserName = 'rpBemLabel6'
        Caption = 'Grupo '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 0
        mmLeft = 0
        mmTop = 0
        mmWidth = 9790
        BandType = 4
      end
      object rpBemDBText6: TppDBText
        UserName = 'rpBemDBText6'
        DataField = 'DESCGRUPO'
        DataPipeline = ppBem
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 10848
        mmTop = 529
        mmWidth = 109538
        BandType = 4
      end
      object rpBemLabel7: TppLabel
        UserName = 'rpBemLabel7'
        Caption = 'Grupo '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 529
        mmWidth = 9790
        BandType = 4
      end
      object rpBemLabel8: TppLabel
        UserName = 'rpBemLabel8'
        Caption = 'Fornecedor '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 176213
        mmTop = 8467
        mmWidth = 17727
        BandType = 4
      end
      object rpBemDBText7: TppDBText
        UserName = 'rpBemDBText7'
        DataField = 'NOMEFORN'
        DataPipeline = ppBem
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 194734
        mmTop = 8467
        mmWidth = 89429
        BandType = 4
      end
      object rpBemLabel9: TppLabel
        UserName = 'rpBemLabel9'
        Caption = 'Entrada em '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 141552
        mmTop = 12435
        mmWidth = 17198
        BandType = 4
      end
      object rpBemDBText8: TppDBText
        UserName = 'rpBemDBText8'
        DataField = 'DTAINCLUSAO'
        DataPipeline = ppBem
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 159279
        mmTop = 12435
        mmWidth = 15875
        BandType = 4
      end
      object rpBemLabel10: TppLabel
        UserName = 'rpBemLabel10'
        Caption = 'Documento '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 176213
        mmTop = 12435
        mmWidth = 17463
        BandType = 4
      end
      object rpBemDBText9: TppDBText
        UserName = 'rpBemDBText9'
        DataField = 'IDNOTA'
        DataPipeline = ppBem
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 194734
        mmTop = 12435
        mmWidth = 25135
        BandType = 4
      end
      object rpBemDBText10: TppDBText
        UserName = 'rpBemDBText10'
        DataField = 'COMPLNOTA'
        DataPipeline = ppBem
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 220398
        mmTop = 12435
        mmWidth = 17198
        BandType = 4
      end
      object rpBemDBText11: TppDBText
        UserName = 'rpBemDBText11'
        DataField = 'VALHISTORICO'
        DataPipeline = ppBem
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 259557
        mmTop = 12435
        mmWidth = 24606
        BandType = 4
      end
      object rpBemLabel11: TppLabel
        UserName = 'rpBemLabel11'
        Caption = 'Valor Histórico '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 237861
        mmTop = 12435
        mmWidth = 22225
        BandType = 4
      end
      object rpBemLabel12: TppLabel
        UserName = 'rpBemLabel12'
        Caption = 'Nº Série'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 85196
        mmTop = 16404
        mmWidth = 11377
        BandType = 4
      end
      object rpBemDBText12: TppDBText
        UserName = 'rpBemDBText12'
        DataField = 'NUMSERIE'
        DataPipeline = ppBem
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 105569
        mmTop = 16404
        mmWidth = 24342
        BandType = 4
      end
      object rpBemLabel13: TppLabel
        UserName = 'rpBemLabel13'
        Caption = 'Classe'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 12435
        mmWidth = 10054
        BandType = 4
      end
      object rpBemDBText13: TppDBText
        UserName = 'rpBemDBText13'
        DataField = 'DESCCLASSE'
        DataPipeline = ppBem
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 18256
        mmTop = 12435
        mmWidth = 65881
        BandType = 4
      end
      object rpBemLabel14: TppLabel
        UserName = 'rpBemLabel14'
        Caption = 'Valor Patrimonial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 21960
        mmWidth = 24871
        BandType = 4
      end
      object rpBemLabel15: TppLabel
        UserName = 'rpBemLabel15'
        Caption = 'Corr. Monetária'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 52123
        mmTop = 21960
        mmWidth = 22754
        BandType = 4
      end
      object rpBemLabel16: TppLabel
        UserName = 'rpBemLabel16'
        Caption = 'Depreciação Acum.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 111125
        mmTop = 21960
        mmWidth = 27781
        BandType = 4
      end
      object rpBemLabel17: TppLabel
        UserName = 'rpBemLabel17'
        Caption = 'Corr.Monet.Depreciação '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 166688
        mmTop = 21960
        mmWidth = 35983
        BandType = 4
      end
      object rpBemLabel18: TppLabel
        UserName = 'rpBemLabel18'
        Caption = 'Valor Contábil '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 237332
        mmTop = 21960
        mmWidth = 21167
        BandType = 4
      end
      object rpBemDBText14: TppDBText
        UserName = 'rpBemDBText14'
        DataField = 'VALORG0'
        DataPipeline = ppBem
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 25665
        mmTop = 21960
        mmWidth = 24871
        BandType = 4
      end
      object rpBemDBText15: TppDBText
        UserName = 'rpBemDBText15'
        DataField = 'CMBEM0'
        DataPipeline = ppBem
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 75406
        mmTop = 21960
        mmWidth = 24871
        BandType = 4
      end
      object rpBemDBText16: TppDBText
        UserName = 'rpBemDBText16'
        DataField = 'DEPLANC0'
        DataPipeline = ppBem
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 139700
        mmTop = 21960
        mmWidth = 24871
        BandType = 4
      end
      object rpBemDBText17: TppDBText
        UserName = 'rpBemDBText17'
        DataField = 'CMDEP0'
        DataPipeline = ppBem
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 203200
        mmTop = 21960
        mmWidth = 24871
        BandType = 4
      end
      object rpBemDBText18: TppDBText
        UserName = 'rpBemDBText18'
        DataField = 'VALCTB0'
        DataPipeline = ppBem
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 259028
        mmTop = 21960
        mmWidth = 24871
        BandType = 4
      end
      object rpBemLabel19: TppLabel
        UserName = 'rpBemLabel19'
        Caption = 'Taxa de Depreciação '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 176213
        mmTop = 16404
        mmWidth = 30427
        BandType = 4
      end
      object rpBemDBText19: TppDBText
        UserName = 'rpBemDBText19'
        DataField = 'TAXADEP'
        DataPipeline = ppBem
        DisplayFormat = '#,0.000000;(#,0.000000)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 207698
        mmTop = 16404
        mmWidth = 15346
        BandType = 4
      end
      object rpBemLabel20: TppLabel
        UserName = 'rpBemLabel20'
        Caption = '% a.a.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 223309
        mmTop = 16404
        mmWidth = 7938
        BandType = 4
      end
      object rpBemLabel21: TppLabel
        UserName = 'rpBemLabel21'
        Caption = 'Situação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 85196
        mmTop = 12435
        mmWidth = 12171
        BandType = 4
      end
      object rpBemDBText20: TppDBText
        UserName = 'rpBemDBText20'
        DataField = 'DESCSITUACAO'
        DataPipeline = ppBem
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 105569
        mmTop = 12435
        mmWidth = 32544
        BandType = 4
      end
      object rpBemLabel22: TppLabel
        UserName = 'rpBemLabel22'
        Caption = 'Controle'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 16404
        mmWidth = 12700
        BandType = 4
      end
      object rpBemLabel23: TppLabel
        UserName = 'rpBemLabel23'
        Caption = 'Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 18256
        mmTop = 16404
        mmWidth = 6085
        BandType = 4
      end
      object rpBemLine2: TppLine
        UserName = 'rpBemLine2'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2
        mmHeight = 1058
        mmLeft = 0
        mmTop = 26458
        mmWidth = 284427
        BandType = 4
      end
      object rpBemLine1: TppLine
        UserName = 'rpBemLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 794
        mmLeft = 0
        mmTop = 20902
        mmWidth = 284427
        BandType = 4
      end
      object rpBemCalc1: TppVariable
        UserName = 'rpBemCalc1'
        CalcOrder = 0
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 10848
        mmTop = 4498
        mmWidth = 15081
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 5821
      mmPrintPosition = 0
      object ppLine2: TppLine
        UserName = 'ppLine2'
        ParentWidth = True
        Weight = 1
        mmHeight = 1058
        mmLeft = 0
        mmTop = 529
        mmWidth = 284427
        BandType = 8
      end
      object ppLabel3: TppLabel
        UserName = 'ppLabel3'
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 1323
        mmWidth = 33867
        BandType = 8
      end
      object ppCalc1: TppSystemVariable
        UserName = 'Calc1'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 114829
        mmTop = 1323
        mmWidth = 54504
        BandType = 8
      end
      object ppCalc2: TppSystemVariable
        UserName = 'Calc2'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 258498
        mmTop = 1323
        mmWidth = 26194
        BandType = 8
      end
    end
  end
  object qryParamCaf: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT MOEDAOFICIAL,MOEDAFISCAL,MOEDAGERENCIAL,NUMDIASANO,'
      '       MASCCODGRUPO,ALUGUELINTERNO,GERARREQMAT,'
      '       DATAULTDEP,DATARECALCDEP,DTAULTALUG,SEQBEMEMP,'
      '       EDITACODBEM,EDITACODGRUPO,SISTEMAS,DATAINICIAL,'
      '       ULTTXTCONTAB,FLGCALCCM,FLGTIPOCALC,MASCARACLASSE,'
      '       INTEGRACONTAB,INTEGRACAP,INTEGRACAR,PLANOVIGENTE,'
      '       FLGREAVAL,TIPOPERCTB,FLGREMOVEPLANCTB,ATIVPROJETO,'
      '       PROXIMAPLACA,FLGCLSDESBEM,DIGMASCPLACA,PATROPADRAO,'
      '       PLANPREVPADRAO'
      'FROM   PARAMETROSCAFMANUT'
      'WHERE (IDPESSOA = :PIDPESSOA)')
    ValidateWithMask = True
    Left = 88
    Top = 120
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
    object qryParamCafMOEDAOFICIAL: TFloatField
      FieldName = 'MOEDAOFICIAL'
      Origin = 'PARAMETROSCAFMANUT.MOEDAOFICIAL'
    end
    object qryParamCafMOEDAFISCAL: TFloatField
      FieldName = 'MOEDAFISCAL'
      Origin = 'PARAMETROSCAFMANUT.MOEDAFISCAL'
    end
    object qryParamCafMOEDAGERENCIAL: TFloatField
      FieldName = 'MOEDAGERENCIAL'
      Origin = 'PARAMETROSCAFMANUT.MOEDAGERENCIAL'
    end
    object qryParamCafNUMDIASANO: TFloatField
      FieldName = 'NUMDIASANO'
      Origin = 'PARAMETROSCAFMANUT.NUMDIASANO'
    end
    object qryParamCafMASCCODGRUPO: TStringField
      FieldName = 'MASCCODGRUPO'
      Origin = 'PARAMETROSCAFMANUT.MASCCODGRUPO'
    end
    object qryParamCafALUGUELINTERNO: TFloatField
      FieldName = 'ALUGUELINTERNO'
      Origin = 'PARAMETROSCAFMANUT.ALUGUELINTERNO'
    end
    object qryParamCafGERARREQMAT: TFloatField
      FieldName = 'GERARREQMAT'
      Origin = 'PARAMETROSCAFMANUT.GERARREQMAT'
    end
    object qryParamCafDATAULTDEP: TDateTimeField
      FieldName = 'DATAULTDEP'
      Origin = 'PARAMETROSCAFMANUT.DATAULTDEP'
    end
    object qryParamCafDATARECALCDEP: TDateTimeField
      FieldName = 'DATARECALCDEP'
      Origin = 'PARAMETROSCAFMANUT.DATARECALCDEP'
    end
    object qryParamCafDTAULTALUG: TDateTimeField
      FieldName = 'DTAULTALUG'
      Origin = 'PARAMETROSCAFMANUT.DTAULTALUG'
    end
    object qryParamCafSEQBEMEMP: TFloatField
      FieldName = 'SEQBEMEMP'
      Origin = 'PARAMETROSCAFMANUT.SEQBEMEMP'
    end
    object qryParamCafEDITACODBEM: TFloatField
      FieldName = 'EDITACODBEM'
      Origin = 'PARAMETROSCAFMANUT.EDITACODBEM'
    end
    object qryParamCafEDITACODGRUPO: TFloatField
      FieldName = 'EDITACODGRUPO'
      Origin = 'PARAMETROSCAFMANUT.EDITACODGRUPO'
    end
    object qryParamCafSISTEMAS: TStringField
      FieldName = 'SISTEMAS'
      Origin = 'PARAMETROSCAFMANUT.SISTEMAS'
      Size = 8
    end
    object qryParamCafDATAINICIAL: TDateTimeField
      FieldName = 'DATAINICIAL'
      Origin = 'PARAMETROSCAFMANUT.DATAINICIAL'
    end
    object qryParamCafULTTXTCONTAB: TDateTimeField
      FieldName = 'ULTTXTCONTAB'
      Origin = 'PARAMETROSCAFMANUT.ULTTXTCONTAB'
    end
    object qryParamCafFLGCALCCM: TFloatField
      FieldName = 'FLGCALCCM'
      Origin = 'PARAMETROSCAFMANUT.FLGCALCCM'
    end
    object qryParamCafFLGTIPOCALC: TStringField
      FieldName = 'FLGTIPOCALC'
      Origin = 'PARAMETROSCAFMANUT.FLGTIPOCALC'
      Size = 1
    end
    object qryParamCafMASCARACLASSE: TStringField
      FieldName = 'MASCARACLASSE'
      Origin = 'PARAMETROSCAFMANUT.MASCARACLASSE'
      Size = 15
    end
    object qryParamCafINTEGRACONTAB: TStringField
      FieldName = 'INTEGRACONTAB'
      Origin = 'PARAMETROSCAFMANUT.INTEGRACONTAB'
      Size = 1
    end
    object qryParamCafINTEGRACAP: TStringField
      FieldName = 'INTEGRACAP'
      Origin = 'PARAMETROSCAFMANUT.INTEGRACAP'
      Size = 1
    end
    object qryParamCafINTEGRACAR: TStringField
      FieldName = 'INTEGRACAR'
      Origin = 'PARAMETROSCAFMANUT.INTEGRACAR'
      Size = 1
    end
    object qryParamCafPLANOVIGENTE: TFloatField
      FieldName = 'PLANOVIGENTE'
    end
    object qryParamCafFLGREAVAL: TStringField
      FieldName = 'FLGREAVAL'
      Size = 1
    end
    object qryParamCafTIPOPERCTB: TStringField
      FieldName = 'TIPOPERCTB'
      Size = 2
    end
    object qryParamCafFLGREMOVEPLANCTB: TStringField
      FieldName = 'FLGREMOVEPLANCTB'
      Origin = '"CM.PARAMETROSCAFMANUT".FLGREMOVEPLANCTB'
      Size = 1
    end
    object qryParamCafATIVPROJETO: TFloatField
      FieldName = 'ATIVPROJETO'
    end
    object qryParamCafPROXIMAPLACA: TFloatField
      FieldName = 'PROXIMAPLACA'
      Origin = '"CM.PARAMETROSCAFMANUT".PROXIMAPLACA'
    end
    object qryParamCafFLGCLSDESBEM: TFloatField
      FieldName = 'FLGCLSDESBEM'
      Origin = '"CM.PARAMETROSCAFMANUT".FLGCLSDESBEM'
    end
    object qryParamCafDIGMASCPLACA: TFloatField
      FieldName = 'DIGMASCPLACA'
    end
    object qryParamCafPATROPADRAO: TFloatField
      FieldName = 'PATROPADRAO'
    end
    object qryParamCafPLANPREVPADRAO: TFloatField
      FieldName = 'PLANPREVPADRAO'
    end
  end
end
