{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Pendências  : SOL 264999.17959 PPM 1181696
Responsável : Michelle Suellyn Mota
Data        : 27/11/2015
Descrição   : Inclusão da coluna DATAPROGRAMADA no relatório de
              Folha de Alguel por Contrato.
--------------------------------------------------------------------------------
Pendências  : 24411
Responsável : Daniel Simões
Data        : 05/04/2007
Descrição   : Implementação dos Reajustes da Folha de Aluguel no relatório de
              Folha de Alguel por Contrato...
--------------------------------------------------------------------------------
-------------------------------------------------------------------------------}

unit CRelFolhaAluguel;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CRel, Mask, wwdbedit, Wwdbspin, wwdblook, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls, Db,
  DBTables, Wwquery, MontaSelect, fcCombo, fcColorCombo, StdCtrls,
  wwdbdatetimepicker, CMDateTimePicker, uModuloImobiliario, mLocatario,
  mContrato, DBClient, uCMClientDataSet, uCtrlPlanPrevContabil, uCtrlImovel,
  uCtrlPlanPrevContabPatro;

type
  TcfgRelFolhaAluguel = class(TcfgRel)
    Label1: TLabel;
    edtAdminImovel: TEdit;
    btnBuscaAdminImovel: TBitBtn;
    btnLimpaAdminImovel: TBitBtn;
    Panel2: TPanel;
    Label5: TLabel;
    edtDataLancamento: TCMDateTimePicker;
    rdgOrdenacao: TRadioGroup;
    chkCorLinha: TCheckBox;
    cboCorLinha: TfcColorCombo;
    Label2: TLabel;
    btnBuscaResponsavel: TBitBtn;
    btnLimpaResponsavel: TBitBtn;
    edtResponsavel: TEdit;
    GroupBox1: TGroupBox;
    cboMes: TComboBox;
    DBspnAno: TwwDBSpinEdit;
    Label15: TLabel;
    Label3: TLabel;
    GroupBox2: TGroupBox;
    cboTipoReceita: TwwDBLookupCombo;
    rdgOrigem: TRadioGroup;
    rdTipoRecIgual: TRadioButton;
    rdTipoRecDiferente: TRadioButton;
    molContrato1: TmolContrato;
    molLocatario1: TmolLocatario;
    dbcboPlanPrev: TwwDBLookupCombo;
    dbcboPatro: TwwDBLookupCombo;
    Label4: TLabel;
    Label6: TLabel;
    cdsPlanPrev: TCMClientDataSet;
    cdsPlanPrevNOME: TStringField;
    cdsPlanPrevIDPLANOPREV: TFloatField;
    cdsPatro: TCMClientDataSet;
    cdsPatroNOME: TStringField;
    cdsPatroIDPESSOA: TFloatField;

    procedure btnBuscaAdminImovelClick(Sender: TObject);
    procedure btnLimpaAdminImovelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnBuscaResponsavelClick(Sender: TObject);
    procedure btnLimpaResponsavelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);


  private { Private declarations }
    iAdminImovel  : integer;
    iResponsavel  : integer;

    //Cássio - SOL Nº 126318 KINTANA Nº 660563
    CtrlImovel : TCtrlImovel;
    CtrlPlanPrevContab : TCtrlPlanPrevContabil;
    CtrlPlanPrevContabPatro : TCtrlPlanPrevContabPatro;

    procedure MontaQuery; override;

  public { Public declarations }

  end;



var
   cfgRelFolhaAluguel: TcfgRelFolhaAluguel;



implementation
{$R *.DFM}
uses
   uSistema, dRelAdminImobCC, UDiasInUteis, dLookImobiliario, uFuncoesImob,
  DMS, dBaseDados, uComunsImobiliario, uMensErro;




procedure TcfgRelFolhaAluguel.MontaQuery;
var
   sSQL : String;
begin
   with dtmRelAdminImobCC do begin
      qryFolhaAluguel.Close;
      LimpaParametros(qryFolhaAluguel);
      // Carrega o Logotipo - Marcio Motta - 05/08/2004
      if ModuloImobiliario.AdminImob.bFlgLogoRelat then
         ppLogoFolhaAluguel.Picture := ModuloImobiliario.AdminImob.LogoTipo.Picture
      else
         ppLogoFolhaAluguel.Picture := nil;

      // Administradora
      if edtAdminImovel.Text <> '' then begin
         rptFolhaAluguel_lblAdministradora.Caption := edtAdminImovel.Text;
      end else begin
         rptFolhaAluguel_lblAdministradora.Caption := '< Todas >';
      end;

      // Responsável
      if edtResponsavel.Text <> '' then begin
         rptFolhaAluguel_lblResponsavel.Caption := edtResponsavel.Text;
      end else begin
         rptFolhaAluguel_lblResponsavel.Caption := '< Todos >';
      end;

      // mês de competência
      rptFolhaAluguel_lblCompetencia.Caption := cboMes.Text + ' / ' + IntToStr(trunc(DBspnAno.Value));

      // determina se as linhas do relatório serão impressas em cores alternadas, e qual cor usar
      bCorlinha   := chkCorLinha.Checked;
      CorLinha    := cboCorLinha.SelectedColor;

   end;


   with dtmRelAdminImobCC.qryFolhaAluguel do
   begin
     sSQL :=
     'SELECT                                                                                     ' + #13 +
     '   DECODE(LI.FLGORIGEMLANC, ''F'', ''FOL'',''M'',''MAN'',''I'',''IMP'') AS DESCORIGEMLANC, ' + #13 +
     '   LI.IDCONTRATOIMOVEL, LI.DATAVENCIMENTO,                                                 ' + #13 +
     '   SUM(LI.VLRLANCRECEB) AS TOT_CONTRATO,                                                   ' + #13 +
     '   DE.TOT_DESC,                                                                            ' + #13 +
     '   C.CONNUMERO, C.CONNOME,                                                                 ' + #13 +

     '   PF.DESCRICAO AS FORMA_PAGAMENTO,                                                        ' + #13 +
     '   T.DESCCUSTORECIMO AS TIPO_RECDES,                                                       ' + #13 +
     '   LI.IDDOCUMENTO, D.NOSSONUMERO,                                                          ' + #13 +

     '   ( NVL(SUM(LI.VLRLANCRECEB),0) - NVL(DE.TOT_DESC,0) ) AS VLR_TOTAL                       ' + #13 +
     //Início - Michelle Mota - SOL: 264999.17959 - PPM: 1181696
     '   , D.DATAPROGRAMADA                                                                      ' + #13 +
     //Término - Michelle Mota - SOL: 264999.17959 - PPM: 1181696 
     'FROM                                                                                       ' + #13 +
     '   DOCUMENTO D,                                                                            ' + #13 +
     '   LANCAMENTOSIMOVEL LI, CONTRATOIMOVEL C,                                                 ' + #13 +
     '   TIPOCUSTORECIMOV T, PORTADORFORMA PF,                                                   ' + #13 +
     '   ( SELECT A.IDDOCUMENTO, SUM(A.VLRALTERADOR) AS TOT_DESC                                 ' + #13 +
     '       FROM ALTERALANCIMOVEL A, TIPOALTERADOR T                                            ' + #13 +
     '      WHERE A.CODALTERADOR = T.CODALTERADOR                                                ' + #13 +
     '        AND T.ACRESDECRES = ''C''                                                          ' + #13 +
     '      GROUP BY IDDOCUMENTO ) DE                                                            ' + #13 +

     'WHERE                                                                                      ' + #13 +
     '        ( LI.RECPAG = ''R'' )                                                              ' + #13 +
     '    AND ( LI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL )                                       ' + #13 +
     '    AND ( C.CODPORTFORMA = PF.CODPORTFORMA )                                               ' + #13 +
     '    AND ( C.FLGTIPOCONTRATO = ''L'' )                                                      ' + #13 +
     '    AND ( LI.IDTIPOCUSTORECIMO = T.IDTIPOCUSTORECIMO )                                     ' + #13 +
     '    AND ( LI.MESCOMPETENCIA =:MES )                                                        ' + #13 +
     '    AND ( LI.ANOCOMPETENCIA =:ANO )                                                        ' + #13 +
     '    AND ( LI.CODDOCUMENTO = D.CODDOCUMENTO(+) )                                            ' + #13 +
     '    AND ( LI.IDDOCUMENTO = DE.IDDOCUMENTO(+) )                                             ' + #13 +
     '    AND ( (:PIDAMINIMOVEL IS NULL) OR (C.IDADMINIMOVEL =:PIDAMINIMOVEL) )                  ' + #13 +
     '    AND ( (:PIDRESPONSAVEL IS NULL) OR (C.IDRESPONSAVEL =:PIDRESPONSAVEL) )                ' + #13 +
     '    AND ( (:PIDCONTRATO IS NULL) OR (C.IDCONTRATOIMOVEL =:PIDCONTRATO) )                   ' + #13 +
     '    AND ( (:PIDLOCATARIO IS NULL) OR (C.IDLOCATARIO =:PIDLOCATARIO) )                      ' + #13 +
     '    AND ( (:PORIGEMLANCAMENTO IS NULL) OR (LI.FLGORIGEMLANC  = :PORIGEMLANCAMENTO) )       ' + #13 +

     '    AND ( ( (:PFILTRO IS NULL) AND ((:PIDTIPORECEITA IS NULL) OR (LI.IDTIPOCUSTORECIMO <> :PIDTIPORECEITA)) ) OR ' + #13 +
     '          ( (:PFILTRO IS NOT NULL) AND ((:PIDTIPORECEITA IS NULL) OR (LI.IDTIPOCUSTORECIMO = :PIDTIPORECEITA)) ) )' + #13 ;

     sSQL := sSQL + ' AND EXISTS (SELECT 1 ' + #13 +
                    '               FROM CONTRATOXIMOVEL CXI, ' + #13 +
                    '                    PLANOPATROXIMOVEL PPI ' + #13 +
                    '              WHERE CXI.IDCONTRATOIMOVEL(+) = LI.IDCONTRATOIMOVEL ' + #13 +
                    '                AND CXI.IDIMOVEL = PPI.IDIMOVEL ';
     if Trim(dbcboPatro.Text) <> ''  then
      sSQL := sSQL + ' AND PPI.IDPATRO = ' + dbcboPatro.LookupValue;

     if Trim(dbcboPlanPrev.Text) <> '' then
      sSQL := sSQL + ' AND PPI.IDPLANOPREV = ' + dbcboPlanPrev.LookupValue;

     sSQL := sSQL + ')';

     sSQL := sSQL + 'GROUP BY                                                                                           ' + #13 +
     '   DECODE(LI.FLGORIGEMLANC, ''F'', ''FOL'',''M'',''MAN'',''I'',''IMP''),                                          ' + #13 +
     '   LI.IDCONTRATOIMOVEL, LI.DATAVENCIMENTO,                                                                        ' + #13 +
     '   DE.TOT_DESC, C.CONNUMERO, C.CONNOME,                                                                           ' + #13 +
     '   PF.DESCRICAO,                                                                                                  ' + #13 +
     '   T.IDTIPOCUSTORECIMO,                                                                                           ' + #13 +
     '   T.DESCCUSTORECIMO, LI.IDDOCUMENTO,                                                                             ' + #13 +
     '   D.NOSSONUMERO                                                                                                  ' + #13 +
     //Início - Michelle Mota - SOL: 264999.17959 - PPM: 1181696
     '   , D.DATAPROGRAMADA                                                                                             ' + #13 +
     //Término - Michelle Mota - SOL: 264999.17959 - PPM: 1181696
     'ORDER BY                                                                                                          ' + #13;

     case rdgOrdenacao.ItemIndex of
         0: sSQL := sSQL + '   C.CONNUMERO';
         1: sSQL := sSQL + '   C.CONNOME';
         2: sSQL := sSQL + '   SUM(LI.VLRLANCRECEB)';
         3: sSQL := sSQL + '   D.NOSSONUMERO';
         4: sSQL := sSQL + '   LI.DATAVENCIMENTO';
      end;

     Sql.Text := sSQL;

     ParamByName('MES').AsInteger  := cboMes.ItemIndex + 1;
     ParamByName('ANO').AsInteger  := StrToInt(IntToStr(trunc(DBspnAno.Value)));

     if iAdminImovel > 0 then ParamByName('PIDAMINIMOVEL').AsInteger            := iAdminImovel;
     if iResponsavel > 0 then ParamByName('PIDRESPONSAVEL').AsInteger           := iResponsavel;
     if molContrato1.iContrato > 0 then ParamByName('PIDCONTRATO').AsInteger    := molContrato1.iContrato;
     if molLocatario1.iLocatario > 0 then ParamByName('PIDLOCATARIO').AsInteger := molLocatario1.iLocatario;

      // Pendência 19981 - Marcos Ventura Topini
      case rdgOrigem.ItemIndex of  // Origem do Lançamento
         0: ParamByName('PORIGEMLANCAMENTO').AsString := 'M'; // Manual
         1: ParamByName('PORIGEMLANCAMENTO').AsString := 'F'; // Folha
         // Pendência 23559 - Marcos Ventura Topini
         3: ParamByName('PORIGEMLANCAMENTO').AsString := 'I'; // Importados
         // Pendência 23559
      end;
      // Fim Pendência 19981

      If (rdTipoRecIgual.Checked) or (rdTipoRecDiferente.Checked) then begin
        if rdTipoRecIgual.Checked then ParamByName('PFILTRO').AsInteger := 0;
        If trim(cboTipoReceita.Text) <> '' then
         ParamByName('PIDTIPORECEITA').AsInteger := StrToInt(cboTipoReceita.LookupValue);
      end;
      // Fim Pendência 19981

      Open;
   end;

// Daniel - 24411 - Início -----------------------------------------------------
   with dtmRelAdminImobCC.qryResumoFolha do begin
      LimpaParametros(dtmRelAdminImobCC.qryResumoFolha);

      ParamByName('MES').AsInteger  := cboMes.ItemIndex+1;
      ParamByName('ANO').AsInteger  := StrToInt(IntToStr(Trunc(DBspnAno.Value)));

      if (iAdminImovel>0) then
        ParamByName('PIDAMINIMOVEL').AsInteger := iAdminImovel;

      if (iResponsavel>0) then
        ParamByName('PIDRESPONSAVEL').AsInteger := iResponsavel;

      if (molContrato1.iContrato>0) then
        ParamByName('PIDCONTRATO').AsInteger := molContrato1.iContrato;

      if (molLocatario1.iLocatario>0) then
        ParamByName('PIDLOCATARIO').AsInteger := molLocatario1.iLocatario;

      if (rdTipoRecIgual.Checked) or (rdTipoRecDiferente.Checked) then begin
        if rdTipoRecIgual.Checked then ParamByName('PFILTRO').AsInteger := 0;
        If trim(cboTipoReceita.Text) <> '' then
         ParamByName('PIDTIPORECEITA').AsInteger := StrToInt(cboTipoReceita.LookupValue);
      end;

      Open;
   end;
// Daniel - 24411 - Fim --------------------------------------------------------

end;



procedure TcfgRelFolhaAluguel.btnBuscaAdminImovelClick(Sender: TObject);
begin
   inherited;

   dtmMS.MS_AdminImovel.Executar;
   // dtmMS.MS_AdminImovel.CamposChave
   //    [0] A.IDADMINIMOVEL
   //    [1] P.NOME
   //    [2] P.RAZAOSOCIAL

   // redesenha o form na volta do MontaSelect
   Repaint;

   // se houve busca, abre a query de Custos/Recebimentos por Imovel com apenas o registro buscado
   if dtmMS.MS_AdminImovel.RetornouValor then begin

      Screen.Cursor := crHourGlass;

      iAdminImovel         := StrToInt(dtmMS.MS_AdminImovel.ValoresChave[0]);
      edtAdminImovel.Text  := dtmMS.MS_AdminImovel.ValoresChave[1];

      Screen.Cursor := crDefault;
   end;

   btnBuscaAdminImovel.SetFocus;
end;



procedure TcfgRelFolhaAluguel.btnLimpaAdminImovelClick(Sender: TObject);
begin
   inherited;

   iAdminImovel := -1;
   edtAdminImovel.Clear;
end;



procedure TcfgRelFolhaAluguel.FormShow(Sender: TObject);
begin
   inherited;

   iAdminImovel := -1;
   edtAdminImovel.Clear;

   iResponsavel := -1;
   edtResponsavel.Clear;

   // preenche a data de lançamento e o ano de referência/competência
   cboMes.ItemIndex        := DiasInUteis.ExtraiMes(Date) - 1;
   DBspnAno.Value          := DiasInUteis.ExtraiAno(Date);

   edtDataLancamento.Date  := DiasInUteis.UltDiaMes(word(trunc(DBspnAno.Value)), (cboMes.ItemIndex + 1));
end;



procedure TcfgRelFolhaAluguel.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   FechaQueries;
   dtmLookImobiliario.qryLookTipoRecDes.close;
   inherited;
end;



procedure TcfgRelFolhaAluguel.btnBuscaResponsavelClick(Sender: TObject);
begin
   inherited;

   dtmMS.MS_Responsavel.Executar;

   // redesenha o form na volta do MontaSelect
   Repaint;

   // se houve busca, abre a query de Custos/Recebimentos por Imovel com apenas o registro buscado
   if dtmMS.MS_Responsavel.RetornouValor then begin

      Screen.Cursor  := crHourGlass;

      iResponsavel         := StrToInt(dtmMS.MS_Responsavel.ValoresChave[0]);
      edtResponsavel.Text  := dtmMS.MS_Responsavel.ValoresChave[1];

      Screen.Cursor := crDefault;
   end;

   btnBuscaResponsavel.SetFocus;
end;



procedure TcfgRelFolhaAluguel.btnLimpaResponsavelClick(Sender: TObject);
begin
   inherited;
   iResponsavel := -1;
   edtResponsavel.Clear;
end;



procedure TcfgRelFolhaAluguel.FormCreate(Sender: TObject);
begin
  inherited;
  //Cássio - SOL Nº 126318 KINTANA Nº 660563 - Início
  CtrlImovel              := TCtrlImovel.Create;
  CtrlPlanPrevContabPatro := TCtrlPlanPrevContabPatro.Create;
  CtrlPlanPrevContab      := TCtrlPlanPrevContabil.Create;

  CtrlImovel.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                       Sistema.ConnectionSide, Sistema.AppRemoteServer, True,
                       ComunsImobiliario.MensErroMT);
  CtrlPlanPrevContabPatro.Initialize(DtmBaseDados.DbBaseDados, True, Sistema.ConnectionType,
                                     Sistema.ConnectionSide, Sistema.AppRemoteServer, True);
  CtrlPlanPrevContab.InitializeAs(CtrlImovel);

  cdsPatro.Data            := CtrlImovel.LookupPatro( Sistema.IdEmpresa );
  cdsPlanPrev.Data         := CtrlPlanPrevContab.ListaPlanPrevContabil;
  //Cássio - SOL Nº 126318 KINTANA Nº 660563 - Fim

  dtmLookImobiliario.qryLookTipoRecDes.Open;
end;

procedure TcfgRelFolhaAluguel.FormDestroy(Sender: TObject);
begin
  inherited;
  //Cássio - SOL Nº 126318 KINTANA Nº 660563 - Início
  FreeAndNil(CtrlImovel);
  FreeAndNil(CtrlPlanPrevContabPatro);
  FreeAndNil(CtrlPlanPrevContab);
  //Cássio - SOL Nº 126318 KINTANA Nº 660563 - Fim
end;

procedure TcfgRelFolhaAluguel.bbtnConfirmarClick(Sender: TObject);
var
  sParamPlanoPatro, sSQL : String;
  imes : integer;
begin
  // Felipe Oliveira - SOL Nº 131924 KINTANA 762445 - Início
  imes := (cboMes.ItemIndex + 1);
  dtmRelAdminImobCC.dDataFinal := StrToDate(FormatDateTime('dd/mm/yyyy',StrToDate('01/'+IntToStr(imes)+'/'+FloatToStr(DBspnAno.Value))));
  // Felipe Oliveira - SOL Nº 131924 KINTANA 762445 - Fim
  
  //Cássio - SOL Nº 126318 KINTANA Nº 660563 - Início
  sParamPlanoPatro := '';
  if (trim(dbcboPlanPrev.Text) <> '') and (trim(dbcboPatro.Text) = '') then
   begin
     MsgDlg('Como o plano contábil foi selecionado, a patrocinadora também deve ser. ' +#13#10+
            'Favor selecione a patrocinadora ou não selecione nenhum dos dois campos.',
            'Informação', mtInformation, [mbOK], 0);
     ModalResult := mrNone;
     dbcboPatro.SetFocus;
     Exit;
   end;
   //Cássio - SOL Nº 126318 KINTANA Nº 660563 - Fim
   
   if (trim(dbcboPlanPrev.Text) <> '') and (trim(dbcboPatro.Text) <> '') then
   begin
    if not CtrlPlanPrevContabPatro.ValidaPlanoPatro(StrToInt(dbcboPatro.LookupValue),
                                                    StrToInt(dbcboPlanPrev.LookupValue)) then
    begin
      MsgDlg(CtrlPlanPrevContabPatro.MessageInfo, 'Informação', mtInformation, [mbOK], 0);
      ModalResult := mrNone;
      dbcboPlanPrev.SetFocus;
      Exit;
    end;
    //Cássio - SOL Nº 126318 KINTANA Nº 660563 - Início
    sParamPlanoPatro := 'EXISTS (SELECT 1    ' +
                        '          FROM PLANOPATROXIMOVEL PPI, CONTRATOXIMOVEL CXI ' +
                        '         WHERE CXI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL '+
                        '           AND CXI.IDIMOVEL = PPI.IDIMOVEL ' +
                        '   AND ((' + cdsPlanPrevIDPLANOPREV.asString + ' IS NOT NULL) AND (PPI.IDPLANOPREV = '+ cdsPlanPrevIDPLANOPREV.asString + ')) ' +
                        '   AND ((' + cdsPatroIDPESSOA.asString + ' IS NOT NULL) AND (PPI.IDPATRO = ' + cdsPatroIDPESSOA.asString +')))';

    sSQL := 'SELECT LI.CODTIPIMOVEL, TI.DESCTIPOIMOVEL,  SUM(LI.VLRLANCRECEB) AS TOT_CONTRATO, ' +
            '       NVL(SUM(DE.TOT_DESC),0) AS TOT_DESC, T.DESCCUSTORECIMO AS TIPO_RECDES,  ' +
            '       ( NVL(SUM(LI.VLRLANCRECEB),0) - NVL(SUM(DE.TOT_DESC),0) ) AS TOTAL ' +
            '  FROM LANCAMENTOSIMOVEL LI, CONTRATOIMOVEL C, TIPOCUSTORECIMOV T, TIPOIMOVEL TI, ' +
            '       ( SELECT A.IDDOCUMENTO, SUM(A.VLRALTERADOR) AS TOT_DESC ' +
            '           FROM ALTERALANCIMOVEL A, TIPOALTERADOR T ' +
            '          WHERE A.CODALTERADOR = T.CODALTERADOR ' +
            '            AND T.ACRESDECRES  = ''C'' ' +
            '           GROUP BY IDDOCUMENTO ) DE  ' +
            ' WHERE 1=2                            ' +
            '   AND ( LI.RECPAG            = ''R'' ) ' +
            '   AND ( LI.IDCONTRATOIMOVEL  = C.IDCONTRATOIMOVEL ) ' +
            '   AND ( C.FLGTIPOCONTRATO    = ''L'' ) ' +
            '   AND ( LI.IDTIPOCUSTORECIMO = T.IDTIPOCUSTORECIMO ) ' +
            '   AND ( LI.CODTIPIMOVEL      =     TI.CODTIPIMOVEL ) ' +
            '   AND ( LI.MESCOMPETENCIA    = :MES) ' +
            '   AND ( LI.ANOCOMPETENCIA    = :ANO) ' +
            '   AND ( LI.IDDOCUMENTO       = DE.IDDOCUMENTO(+) ) ' +
            '   AND ( (:PIDAMINIMOVEL IS NULL)     OR (C.IDADMINIMOVEL = :PIDAMINIMOVEL) ) ' +
            '   AND ( (:PIDRESPONSAVEL IS NULL)    OR (C.IDRESPONSAVEL    = :PIDRESPONSAVEL) ) ' +
            '   AND ( (:PIDCONTRATO  IS NULL)       OR (C.IDCONTRATOIMOVEL = :PIDCONTRATO ) ) ' +
            '   AND ( (:PIDLOCATARIO IS NULL)      OR (C.IDLOCATARIO      = :PIDLOCATARIO) ) ' +
            '   AND ( (:PORIGEMLANCAMENTO  IS NULL) OR (LI.FLGORIGEMLANC  = :PORIGEMLANCAMENTO ) ) ' +
            '   AND ( ( (:PFILTRO IS NULL)     AND ((:PIDTIPORECEITA IS NULL) OR (LI.IDTIPOCUSTORECIMO <> :PIDTIPORECEITA)) ) OR ' +
            '         ( (:PFILTRO IS NOT NULL) AND ((:PIDTIPORECEITA IS NULL) OR (LI.IDTIPOCUSTORECIMO =  :PIDTIPORECEITA)) ) )' ;

    sSQL := sSQL + sParamPlanoPatro +
            ' GROUP BY T.IDTIPOCUSTORECIMO, T.DESCCUSTORECIMO, LI.CODTIPIMOVEL, TI.DESCTIPOIMOVEL ' +
            ' ORDER BY TI.DESCTIPOIMOVEL, LI.CODTIPIMOVEL, T.DESCCUSTORECIMO';

    dtmRelAdminImobCC.qryFolhaAluguel.SQL.Text := sSQL;
   end;
    //Cássio - SOL Nº 126318 KINTANA Nº 660563 - Fim.
  inherited;
end;

end.
