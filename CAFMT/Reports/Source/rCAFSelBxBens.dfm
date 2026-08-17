inherited RptCAFSelBxBens: TRptCAFSelBxBens
  Left = 444
  Top = 245
  Width = 287
  Height = 150
  Caption = 'RptCAFSelBxBens'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited CmpRptCM: TCmParamReport
    Caption = 'Seleção de Bens para Baixa'
    DataBaseName = 'Basedados'
    Params = <
      item
        Caption = 'Termo'
        Controle = tcEdit
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
        CheckBoxSetings.ValueChecked = 'False'
        CheckBoxSetings.ValueUnChecked = 'False'
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
        Caption = 'Data da Seleção'
        Controle = tcEdit
        TipodeDado = tdDate
        LookupSettings.SQL.Strings = ()
        CheckBoxSetings.ValueChecked = 'False'
        CheckBoxSetings.ValueUnChecked = 'False'
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
        Caption = ' Termos '
        Controle = tcRadioGroup
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
        CheckBoxSetings.ValueChecked = 'False'
        CheckBoxSetings.ValueUnChecked = 'False'
        RadioGroupSettings.Items.Strings = (
          'Não Executados'
          'Executados'
          'Ambos')
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 3
        RadioGroupSettings.ItemIndex = 0
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
        Caption = ' Incluir Valor '
        Controle = tcRadioGroup
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
        CheckBoxSetings.ValueChecked = 'False'
        CheckBoxSetings.ValueUnChecked = 'False'
        RadioGroupSettings.Items.Strings = (
          'Residual'
          'Aquisição')
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 3
        RadioGroupSettings.ItemIndex = 0
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
        Caption = ' Ordenado por '
        Controle = tcRadioGroup
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
        CheckBoxSetings.ValueChecked = 'False'
        CheckBoxSetings.ValueUnChecked = 'False'
        RadioGroupSettings.Items.Strings = (
          'Placa'
          'Descrição'
          'Valor de Aquisição')
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 3
        RadioGroupSettings.ItemIndex = 0
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
      end>
    Formheight = 280
    Left = 16
  end
  inherited DevRptCM: TExtraOptions
    Left = 144
  end
  inherited CrmRptCM: TCmRptManager
    BeforePrint = CrmRptCMBeforePrint
    ChangeDataBaseName = CrmRptCMChangeDataBaseName
    DataBaseName = 'BaseDados'
    Report = rpSelBxBens
    Left = 80
  end
  object qrySldCtb: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT B.IDBEM, B.IDPESSOA,'
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
        'B'
      ''
      'FROM BEM B,'
      ''
      '   (SELECT NVL(SUM(VM.VALOFI),0) AS VALBEMACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDBEM = :PIDBEM)'
      '      AND  (HM.IDPESSOA = :PIDPESSOA)'
      '      AND  (HM.IDTIPOMOVIMENTACAO IN (01,41))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    ) BEMACUM,'
      ''
      '   (SELECT NVL(SUM(VM.VALOFI),0) AS VALREAVACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM,'
      '           REAVALIACAO R'
      '    WHERE  (HM.IDBEM = :PIDBEM)'
      '      AND  (HM.IDPESSOA = :PIDPESSOA)'
      '      AND  (HM.IDTIPOMOVIMENTACAO IN (08,32,45))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (R.FLGULTREAVAL = 0)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '      AND  (R.IDMOVIMENTACAO  = HM.IDMOVIMENTACAO(+))'
      '    ) REAVACUM,'
      ''
      '   (SELECT NVL(SUM(VM.VALOFI),0) AS VALACRESACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDBEM = :PIDBEM)'
      '      AND  (HM.IDPESSOA = :PIDPESSOA)'
      '      AND  (HM.IDTIPOMOVIMENTACAO IN (09,49))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    ) ACRESACUM,'
      ''
      '   (SELECT NVL(SUM(VM.VALOFI),0) AS VALCMBEMACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDBEM = :PIDBEM)'
      '      AND  (HM.IDPESSOA = :PIDPESSOA)'
      '      AND  (HM.IDTIPOMOVIMENTACAO IN (15,42))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    ) CMBEMACUM,'
      ''
      '   (SELECT NVL(SUM(VM.VALOFI),0) AS VALCMREAVACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM,'
      '           REAVALIACAO R, DEPRECIACAOREAVAL DR'
      '    WHERE  (HM.IDBEM = :PIDBEM)'
      '      AND  (HM.IDPESSOA = :PIDPESSOA)'
      '      AND  (HM.IDTIPOMOVIMENTACAO IN (22,46))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (R.FLGULTREAVAL = 0)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '      AND  (DR.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+))'
      '      AND  (DR.IDREAVALIACAO  = R.IDREAVALIACAO(+))'
      '    ) CMREAVACUM,'
      ''
      '   (SELECT NVL(SUM(VM.VALOFI),0) AS VALCMACRESACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDBEM = :PIDBEM)'
      '      AND  (HM.IDPESSOA = :PIDPESSOA)'
      '      AND  (HM.IDTIPOMOVIMENTACAO IN (34,50))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    ) CMACRESACUM,'
      ''
      '   (SELECT NVL(SUM(VM.VALOFI),0) AS VALDEPBEMACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDBEM = :PIDBEM)'
      '      AND  (HM.IDPESSOA = :PIDPESSOA)'
      '      AND  (HM.IDTIPOMOVIMENTACAO IN (14,17,43))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    ) DEPBEMACUM,'
      ''
      '   (SELECT NVL(SUM(VM.VALOFI),0) AS VALDEPREAVACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM,'
      '           REAVALIACAO R, DEPRECIACAOREAVAL DR'
      '    WHERE  (HM.IDBEM = :PIDBEM)'
      '      AND  (HM.IDPESSOA = :PIDPESSOA)'
      '      AND  (HM.IDTIPOMOVIMENTACAO IN (18,33,47))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (R.FLGULTREAVAL = 0)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '      AND  (DR.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+))'
      '      AND  (DR.IDREAVALIACAO  = R.IDREAVALIACAO(+))'
      '    ) DEPREAVACUM,'
      ''
      '   (SELECT NVL(SUM(VM.VALOFI),0) AS VALDEPACRESACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDBEM = :PIDBEM)'
      '      AND  (HM.IDPESSOA = :PIDPESSOA)'
      '      AND  (HM.IDTIPOMOVIMENTACAO IN (35,51))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    ) DEPACRESACUM,'
      ''
      '   (SELECT NVL(SUM(VM.VALOFI),0) AS VALCMDEPBEMACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDBEM = :PIDBEM)'
      '      AND  (HM.IDPESSOA = :PIDPESSOA)'
      '      AND  (HM.IDTIPOMOVIMENTACAO IN (21,44))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    ) CMDEPBEMACUM,'
      ''
      '   (SELECT NVL(SUM(VM.VALOFI),0) AS VALCMDEPREAVACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM,'
      '           REAVALIACAO R, DEPRECIACAOREAVAL DR'
      '    WHERE  (HM.IDBEM = :PIDBEM)'
      '      AND  (HM.IDPESSOA = :PIDPESSOA)'
      '      AND  (HM.IDTIPOMOVIMENTACAO IN (19,48))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (R.FLGULTREAVAL = 0)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '      AND  (DR.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+))'
      '      AND  (DR.IDREAVALIACAO  = R.IDREAVALIACAO(+))'
      '    ) CMDEPREAVACUM,'
      ''
      '   (SELECT NVL(SUM(VM.VALOFI),0) AS VALCMDEPACRESACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDBEM = :PIDBEM)'
      '      AND  (HM.IDPESSOA = :PIDPESSOA)'
      '      AND  (HM.IDTIPOMOVIMENTACAO IN (36,52))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    ) CMDEPACRESACUM,'
      ''
      '   (SELECT NVL(SUM(VM.VALOFI),0) AS VALULTREAVACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM,'
      '           REAVALIACAO R'
      '    WHERE  (HM.IDBEM = :PIDBEM)'
      '      AND  (HM.IDPESSOA = :PIDPESSOA)'
      '      AND  (HM.IDTIPOMOVIMENTACAO IN (08,32,45))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (R.FLGULTREAVAL = 1)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '      AND  (R.IDMOVIMENTACAO  = HM.IDMOVIMENTACAO(+))'
      '    ) ULTREAVACUM,'
      ''
      '   (SELECT NVL(SUM(VM.VALOFI),0) AS VALULTCMREAVACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM,'
      '           REAVALIACAO R, DEPRECIACAOREAVAL DR'
      '    WHERE  (HM.IDBEM = :PIDBEM)'
      '      AND  (HM.IDPESSOA = :PIDPESSOA)'
      '      AND  (HM.IDTIPOMOVIMENTACAO IN (22,46))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (R.FLGULTREAVAL = 1)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '      AND  (DR.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+))'
      '      AND  (DR.IDREAVALIACAO  = R.IDREAVALIACAO(+))'
      '    ) ULTCMREAVACUM,'
      ''
      '   (SELECT NVL(SUM(VM.VALOFI),0) AS VALULTDEPREAVACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM,'
      '           REAVALIACAO R, DEPRECIACAOREAVAL DR'
      '    WHERE  (HM.IDBEM = :PIDBEM)'
      '      AND  (HM.IDPESSOA = :PIDPESSOA)'
      '      AND  (HM.IDTIPOMOVIMENTACAO IN (18,33,19,47))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (R.FLGULTREAVAL = 1)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '      AND  (DR.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+))'
      '      AND  (DR.IDREAVALIACAO  = R.IDREAVALIACAO(+))'
      '    ) ULTDEPREAVACUM,'
      ''
      '   (SELECT NVL(SUM(VM.VALOFI),0) AS VALULTCMDEPREAVACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM,'
      '           REAVALIACAO R, DEPRECIACAOREAVAL DR'
      '    WHERE  (HM.IDBEM = :PIDBEM)'
      '      AND  (HM.IDPESSOA = :PIDPESSOA)'
      '      AND  (HM.IDTIPOMOVIMENTACAO IN (19,48))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (R.FLGULTREAVAL = 1)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '      AND  (DR.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+))'
      '      AND  (DR.IDREAVALIACAO  = R.IDREAVALIACAO(+))'
      '    ) ULTCMDEPREAVACUM,'
      ''
      '   (SELECT NVL(SUM(VM.VALOFI),0) AS BXVALBEMACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDBEM = :PIDBEM)'
      '      AND  (HM.IDPESSOA = :PIDPESSOA)'
      '      AND  (HM.IDTIPOMOVIMENTACAO = 6)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    ) BXBEMACUM,'
      ''
      '   (SELECT NVL(SUM(VM.VALOFI),0) AS BXVALREAVACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM,'
      '           REAVALIACAO R, BAIXABEM BR'
      '    WHERE  (HM.IDBEM = :PIDBEM)'
      '      AND  (HM.IDPESSOA = :PIDPESSOA)'
      '      AND  (HM.IDTIPOMOVIMENTACAO = 20)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (R.FLGULTREAVAL = 0)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '      AND  (BR.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+))'
      '      AND  (BR.IDREAVAL       = R.IDREAVALIACAO(+))'
      '    ) BXREAVACUM,'
      ''
      '   (SELECT NVL(SUM(VM.VALOFI),0) AS BXVALACRESACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDBEM = :PIDBEM)'
      '      AND  (HM.IDPESSOA = :PIDPESSOA)'
      '      AND  (HM.IDTIPOMOVIMENTACAO = 37)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    ) BXACRESACUM,'
      ''
      '   (SELECT NVL(SUM(VM.VALOFI),0) AS BXVALCMBEMACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDBEM = :PIDBEM)'
      '      AND  (HM.IDPESSOA = :PIDPESSOA)'
      '      AND  (HM.IDTIPOMOVIMENTACAO = 25)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    ) BXCMBEMACUM,'
      ''
      '   (SELECT NVL(SUM(VM.VALOFI),0) AS BXVALCMREAVACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM,'
      '           REAVALIACAO R, BAIXABEM BR'
      '    WHERE  (HM.IDBEM = :PIDBEM)'
      '      AND  (HM.IDPESSOA = :PIDPESSOA)'
      '      AND  (HM.IDTIPOMOVIMENTACAO = 28)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (R.FLGULTREAVAL = 0)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '      AND  (BR.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+))'
      '      AND  (BR.IDREAVAL       = R.IDREAVALIACAO(+))'
      '    ) BXCMREAVACUM,'
      ''
      '   (SELECT NVL(SUM(VM.VALOFI),0) AS BXVALCMACRESACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDBEM = :PIDBEM)'
      '      AND  (HM.IDPESSOA = :PIDPESSOA)'
      '      AND  (HM.IDTIPOMOVIMENTACAO = 38)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    ) BXCMACRESACUM,'
      ''
      '   (SELECT NVL(SUM(VM.VALOFI),0) AS BXVALDEPBEMACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDBEM = :PIDBEM)'
      '      AND  (HM.IDPESSOA = :PIDPESSOA)'
      '      AND  (HM.IDTIPOMOVIMENTACAO = 24)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    ) BXDEPBEMACUM,'
      ''
      '   (SELECT NVL(SUM(VM.VALOFI),0) AS BXVALDEPREAVACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM,'
      '           REAVALIACAO R, BAIXABEM BR'
      '    WHERE  (HM.IDBEM = :PIDBEM)'
      '      AND  (HM.IDPESSOA = :PIDPESSOA)'
      '      AND  (HM.IDTIPOMOVIMENTACAO = 27)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (R.FLGULTREAVAL = 0)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '      AND  (BR.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+))'
      '      AND  (BR.IDREAVAL       = R.IDREAVALIACAO(+))'
      '    ) BXDEPREAVACUM,'
      ''
      '   (SELECT NVL(SUM(VM.VALOFI),0) AS BXVALDEPACRESACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDBEM = :PIDBEM)'
      '      AND  (HM.IDPESSOA = :PIDPESSOA)'
      '      AND  (HM.IDTIPOMOVIMENTACAO = 39)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    ) BXDEPACRESACUM,'
      ''
      '   (SELECT NVL(SUM(VM.VALOFI),0) AS BXVALCMDEPBEMACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDBEM = :PIDBEM)'
      '      AND  (HM.IDPESSOA = :PIDPESSOA)'
      '      AND  (HM.IDTIPOMOVIMENTACAO = 26)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    ) BXCMDEPBEMACUM,'
      ''
      '   (SELECT NVL(SUM(VM.VALOFI),0) AS BXVALCMDEPREAVACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM,'
      '           REAVALIACAO R, BAIXABEM BR'
      '    WHERE  (HM.IDBEM = :PIDBEM)'
      '      AND  (HM.IDPESSOA = :PIDPESSOA)'
      '      AND  (HM.IDTIPOMOVIMENTACAO = 29)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (R.FLGULTREAVAL = 0)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '      AND  (BR.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+))'
      '      AND  (BR.IDREAVAL       = R.IDREAVALIACAO(+))'
      '    ) BXCMDEPREAVACUM,'
      ''
      '   (SELECT NVL(SUM(VM.VALOFI),0) AS BXVALCMDEPACRESACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM'
      '    WHERE  (HM.IDBEM = :PIDBEM)'
      '      AND  (HM.IDPESSOA = :PIDPESSOA)'
      '      AND  (HM.IDTIPOMOVIMENTACAO = 40)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '    ) BXCMDEPACRESACUM,'
      ''
      '   (SELECT NVL(SUM(VM.VALOFI),0) AS BXVALULTREAVACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM,'
      '           REAVALIACAO R, BAIXABEM BR'
      '    WHERE  (HM.IDBEM = :PIDBEM)'
      '      AND  (HM.IDPESSOA = :PIDPESSOA)'
      '      AND  (HM.IDTIPOMOVIMENTACAO = 20)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (R.FLGULTREAVAL = 1)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '      AND  (BR.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+))'
      '      AND  (BR.IDREAVAL       = R.IDREAVALIACAO(+))'
      '    ) BXULTREAVACUM,'
      ''
      '   (SELECT NVL(SUM(VM.VALOFI),0) AS BXVALULTCMREAVACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM,'
      '           REAVALIACAO R, BAIXABEM BR'
      '    WHERE  (HM.IDBEM = :PIDBEM)'
      '      AND  (HM.IDPESSOA = :PIDPESSOA)'
      '      AND  (HM.IDTIPOMOVIMENTACAO = 28)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (R.FLGULTREAVAL = 1)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '      AND  (BR.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+))'
      '      AND  (BR.IDREAVAL       = R.IDREAVALIACAO(+))'
      '    ) BXULTCMREAVACUM,'
      ''
      '   (SELECT NVL(SUM(VM.VALOFI),0) AS BXVALULTDEPREAVACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM,'
      '           REAVALIACAO R, BAIXABEM BR'
      '    WHERE  (HM.IDBEM = :PIDBEM)'
      '      AND  (HM.IDPESSOA = :PIDPESSOA)'
      '      AND  (HM.IDTIPOMOVIMENTACAO = 27)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (R.FLGULTREAVAL = 1)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '      AND  (BR.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+))'
      '      AND  (BR.IDREAVAL       = R.IDREAVALIACAO(+))'
      '    ) BXULTDEPREAVACUM,'
      ''
      '   (SELECT NVL(SUM(VM.VALOFI),0) AS BXVALULTCMDEPREAVACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM,VALORMOVIMENTACAO VM,'
      '           REAVALIACAO R, BAIXABEM BR'
      '    WHERE  (HM.IDBEM = :PIDBEM)'
      '      AND  (HM.IDPESSOA = :PIDPESSOA)'
      '      AND  (HM.IDTIPOMOVIMENTACAO = 29)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (R.FLGULTREAVAL = 1)'
      '      AND  (HM.IDMOVIMENTACAO = VM.IDMOVIMENTACAO(+))'
      '      AND  (BR.IDMOVIMENTACAO = HM.IDMOVIMENTACAO(+))'
      '      AND  (BR.IDREAVAL       = R.IDREAVALIACAO(+))'
      '    ) BXULTCMDEPREAVACUM'
      ''
      'WHERE (B.IDBEM    = :PIDBEM)'
      '  AND (B.IDPESSOA = :PIDPESSOA)'
      
        '  AND((B.DATAINICIODEP <= :PDATAMOV) OR (B.DATAINICIODEP IS NULL' +
        '))'
      '')
    ValidateWithMask = True
    Left = 80
    Top = 64
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end>
    object qrySldCtbIDBEM: TFloatField
      FieldName = 'IDBEM'
    end
    object qrySldCtbIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qrySldCtbVALCTB: TFloatField
      FieldName = 'VALCTB'
    end
  end
  object updSelBxBens: TUpdateSQL
    ModifySQL.Strings = (
      'update SELBAIXA'
      'set'
      '  VALCTB = :VALCTB'
      'where'
      '  IDSELBAIXA = :OLD_IDSELBAIXA and'
      '  IDBEM = :OLD_IDBEM and'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into SELBAIXA'
      '  (VALCTB)'
      'values'
      '  (:VALCTB)')
    DeleteSQL.Strings = (
      'delete from SELBAIXA'
      'where'
      '  IDSELBAIXA = :OLD_IDSELBAIXA and'
      '  IDBEM = :OLD_IDBEM and'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 210
    Top = 61
  end
  object qrySelBxBens: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT SB.SBXTERMO, SB.IDSELBAIXA,'
      '       SB.SBXPROCESSO,'
      '       SB.SBXDATA,'
      '       PR.NOME AS NOMERESP, PD.NOME AS NOMEDEST,'
      '       B.PLACA,'
      '       B.IDBEM, SBB.IDPESSOA,'
      '       B.DESBEM AS DESCBEM,'
      '       B.VALORG AS VALAQUIS,'
      '       (0)      AS VALCTB,'
      '       SB.SBXFLGEXECUTADO,'
      '       SB.SBXDTAEXECUTADO'
      'FROM'
      '       SELBAIXA SB,'
      '       SELBAIXABENS SBB,'
      '       BEM B,'
      '       PESSOA PR,'
      '       PESSOA PD'
      'WHERE'
      ''
      ''
      ''
      ''
      '      (SB.SBTIPOMOV  = 0)'
      '  AND (SB.IDSELBAIXA = SBB.IDSELBAIXA)'
      '  AND (SBB.IDBEM     = B.IDBEM)'
      '  AND (SBB.IDPESSOA  = B.IDPESSOA)'
      '  AND (SB.IDRESPONSAVEL = PR.IDPESSOA(+))'
      '  AND (SB.IDDESTINOBAIXA = PD.IDPESSOA(+))'
      ''
      '')
    UpdateObject = updSelBxBens
    ValidateWithMask = True
    Left = 209
    Top = 48
    object qrySelBxBensSBXTERMO: TFloatField
      FieldName = 'SBXTERMO'
    end
    object qrySelBxBensIDSELBAIXA: TFloatField
      FieldName = 'IDSELBAIXA'
    end
    object qrySelBxBensSBXPROCESSO: TStringField
      FieldName = 'SBXPROCESSO'
      Size = 80
    end
    object qrySelBxBensSBXDATA: TDateTimeField
      FieldName = 'SBXDATA'
    end
    object qrySelBxBensNOMERESP: TStringField
      FieldName = 'NOMERESP'
      Size = 60
    end
    object qrySelBxBensNOMEDEST: TStringField
      FieldName = 'NOMEDEST'
      Size = 60
    end
    object qrySelBxBensPLACA: TFloatField
      FieldName = 'PLACA'
    end
    object qrySelBxBensIDBEM: TFloatField
      FieldName = 'IDBEM'
    end
    object qrySelBxBensIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qrySelBxBensDESCBEM: TStringField
      FieldName = 'DESCBEM'
      Size = 200
    end
    object qrySelBxBensVALAQUIS: TFloatField
      FieldName = 'VALAQUIS'
    end
    object qrySelBxBensVALCTB: TFloatField
      FieldName = 'VALCTB'
    end
    object qrySelBxBensSBXFLGEXECUTADO: TFloatField
      FieldName = 'SBXFLGEXECUTADO'
    end
    object qrySelBxBensSBXDTAEXECUTADO: TDateTimeField
      FieldName = 'SBXDTAEXECUTADO'
    end
  end
  object dsSelBxBens: TwwDataSource
    DataSet = qrySelBxBens
    Left = 211
    Top = 36
  end
  object ppSelBxBens: TppBDEPipeline
    DataSource = dsSelBxBens
    UserName = 'SelBxBens'
    Left = 211
    Top = 23
  end
  object rpSelBxBens: TppReport
    AutoStop = False
    DataPipeline = ppSelBxBens
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utMillimeters
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 211
    Top = 10
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 17727
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'ppLabel1'
        Caption = 'Termo de Baixa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 16
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 6350
        mmLeft = 77788
        mmTop = 8467
        mmWidth = 41804
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'ppLine1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1058
        mmLeft = 0
        mmTop = 16669
        mmWidth = 197300
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
        mmLeft = 83873
        mmTop = 1588
        mmWidth = 29633
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 8731
      mmPrintPosition = 0
      object rpSelBxBensDBCalc1: TppDBCalc
        UserName = 'rpSelBxBensDBCalc1'
        DataField = 'SBXTERMO'
        DataPipeline = ppSelBxBens
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        ResetGroup = rpSelBxBensGroup1
        TextAlignment = taRightJustified
        Transparent = True
        DBCalcType = dcCount
        mmHeight = 4233
        mmLeft = 0
        mmTop = 0
        mmWidth = 7673
        BandType = 4
      end
      object rpSelBxBensDBText7: TppDBText
        UserName = 'rpSelBxBensDBText7'
        DataField = 'PLACA'
        DataPipeline = ppSelBxBens
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 10583
        mmTop = 0
        mmWidth = 26458
        BandType = 4
      end
      object rpSelBxBensDBText9: TppDBText
        UserName = 'rpSelBxBensDBText9'
        DataField = 'VALAQUIS'
        DataPipeline = ppSelBxBens
        DisplayFormat = '#,0.00;(#,0.00)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4233
        mmLeft = 168275
        mmTop = 0
        mmWidth = 29104
        BandType = 4
      end
      object rpSelBxBensDBMemo1: TppDBMemo
        UserName = 'rpSelBxBensDBMemo1'
        CharWrap = True
        DataField = 'DESCBEM'
        DataPipeline = ppSelBxBens
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Stretch = True
        Transparent = True
        mmHeight = 8731
        mmLeft = 38365
        mmTop = 0
        mmWidth = 128323
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmLeading = 0
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 5821
      mmPrintPosition = 0
      object ppLine2: TppLine
        UserName = 'ppLine2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 265
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel14: TppLabel
        UserName = 'ppLabel14'
        AutoSize = False
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3969
        mmLeft = 0
        mmTop = 794
        mmWidth = 70908
        BandType = 8
      end
      object ppCalc1: TppSystemVariable
        UserName = 'Calc1'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3969
        mmLeft = 171450
        mmTop = 794
        mmWidth = 26194
        BandType = 8
      end
      object ppCalc2: TppSystemVariable
        UserName = 'Calc2'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3969
        mmLeft = 72231
        mmTop = 794
        mmWidth = 52917
        BandType = 8
      end
    end
    object rpSelBxBensGroup1: TppGroup
      BreakName = 'SBXTERMO'
      DataPipeline = ppSelBxBens
      NewPage = True
      ResetPageNo = True
      UserName = 'rpSelBxBensGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rpSelBxBensGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 22754
        mmPrintPosition = 0
        object rpSelBxBensLabel1: TppLabel
          UserName = 'rpSelBxBensLabel1'
          Caption = 'Termo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 0
          mmWidth = 10848
          BandType = 3
          GroupNo = 0
        end
        object rpSelBxBensLabel2: TppLabel
          UserName = 'rpSelBxBensLabel2'
          Caption = 'Processo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 3969
          mmWidth = 15081
          BandType = 3
          GroupNo = 0
        end
        object rpSelBxBensLabel3: TppLabel
          UserName = 'rpSelBxBensLabel3'
          Caption = 'Responsável'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 7938
          mmWidth = 21167
          BandType = 3
          GroupNo = 0
        end
        object rpSelBxBensLabel4: TppLabel
          UserName = 'rpSelBxBensLabel4'
          Caption = 'Destinatário'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 11906
          mmWidth = 20108
          BandType = 3
          GroupNo = 0
        end
        object rpSelBxBensLabel6: TppLabel
          UserName = 'rpSelBxBensLabel6'
          Caption = 'Patrimônio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 10583
          mmTop = 17463
          mmWidth = 16404
          BandType = 3
          GroupNo = 0
        end
        object rpSelBxBensLabel5: TppLabel
          UserName = 'rpSelBxBensLabel5'
          Caption = 'Item'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 17463
          mmWidth = 6615
          BandType = 3
          GroupNo = 0
        end
        object rpSelBxBensLabel7: TppLabel
          UserName = 'rpSelBxBensLabel7'
          Caption = 'Descrição do Bem'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 38365
          mmTop = 17463
          mmWidth = 28310
          BandType = 3
          GroupNo = 0
        end
        object rpSelBxBensLabel8: TppLabel
          UserName = 'rpSelBxBensLabel8'
          Caption = 'Valor Aquisição'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 173302
          mmTop = 17463
          mmWidth = 24077
          BandType = 3
          GroupNo = 0
        end
        object rpSelBxBensLine1: TppLine
          UserName = 'rpSelBxBensLine1'
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 16669
          mmWidth = 197380
          BandType = 3
          GroupNo = 0
        end
        object rpSelBxBensLine2: TppLine
          UserName = 'rpSelBxBensLine2'
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 22225
          mmWidth = 197380
          BandType = 3
          GroupNo = 0
        end
        object rpSelBxBensDBText1: TppDBText
          UserName = 'rpSelBxBensDBText1'
          AutoSize = True
          DataField = 'SBXTERMO'
          DataPipeline = ppSelBxBens
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 23283
          mmTop = 0
          mmWidth = 1852
          BandType = 3
          GroupNo = 0
        end
        object rpSelBxBensDBText2: TppDBText
          UserName = 'rpSelBxBensDBText2'
          DataField = 'SBXPROCESSO'
          DataPipeline = ppSelBxBens
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 23283
          mmTop = 3969
          mmWidth = 110596
          BandType = 3
          GroupNo = 0
        end
        object rpSelBxBensDBText3: TppDBText
          UserName = 'rpSelBxBensDBText3'
          DataField = 'NOMERESP'
          DataPipeline = ppSelBxBens
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 23283
          mmTop = 7938
          mmWidth = 174096
          BandType = 3
          GroupNo = 0
        end
        object rpSelBxBensLabel9: TppLabel
          UserName = 'rpSelBxBensLabel9'
          Caption = 'Selecionado em'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 134938
          mmTop = 0
          mmWidth = 27517
          BandType = 3
          GroupNo = 0
        end
        object rpSelBxBensLabel10: TppLabel
          UserName = 'rpSelBxBensLabel10'
          Caption = 'Executado em'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 134938
          mmTop = 3969
          mmWidth = 27517
          BandType = 3
          GroupNo = 0
        end
        object rpSelBxBensDBText4: TppDBText
          UserName = 'rpSelBxBensDBText4'
          DataField = 'NOMEDEST'
          DataPipeline = ppSelBxBens
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 4233
          mmLeft = 23283
          mmTop = 11906
          mmWidth = 174096
          BandType = 3
          GroupNo = 0
        end
        object rpSelBxBensDBText5: TppDBText
          UserName = 'rpSelBxBensDBText5'
          AutoSize = True
          DataField = 'SBXDATA'
          DataPipeline = ppSelBxBens
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 162719
          mmTop = 0
          mmWidth = 17727
          BandType = 3
          GroupNo = 0
        end
        object rpSelBxBensDBText6: TppDBText
          UserName = 'rpSelBxBensDBText6'
          AutoSize = True
          DataField = 'SBXDTAEXECUTADO'
          DataPipeline = ppSelBxBens
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = []
          Transparent = True
          mmHeight = 3969
          mmLeft = 162719
          mmTop = 3969
          mmWidth = 36248
          BandType = 3
          GroupNo = 0
        end
      end
      object rpSelBxBensGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 5821
        mmPrintPosition = 0
        object rpSelBxBensLabel11: TppLabel
          UserName = 'rpSelBxBensLabel11'
          Caption = 'SOMA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 4233
          mmLeft = 0
          mmTop = 529
          mmWidth = 10319
          BandType = 5
          GroupNo = 0
        end
        object rpSelBxBensDBCalc2: TppDBCalc
          UserName = 'rpSelBxBensDBCalc2'
          DataField = 'VALAQUIS'
          DataPipeline = ppSelBxBens
          DisplayFormat = '#,0.00;(#,0.00)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 10
          Font.Style = [fsBold]
          ResetGroup = rpSelBxBensGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 4233
          mmLeft = 168275
          mmTop = 529
          mmWidth = 29104
          BandType = 5
          GroupNo = 0
        end
        object rpSelBxBensLine3: TppLine
          UserName = 'rpSelBxBensLine3'
          Weight = 0.75
          mmHeight = 529
          mmLeft = 0
          mmTop = 5027
          mmWidth = 197380
          BandType = 5
          GroupNo = 0
        end
        object rpSelBxBensLine4: TppLine
          UserName = 'rpSelBxBensLine4'
          Weight = 0.75
          mmHeight = 265
          mmLeft = 265
          mmTop = 0
          mmWidth = 197380
          BandType = 5
          GroupNo = 0
        end
      end
    end
  end
end
