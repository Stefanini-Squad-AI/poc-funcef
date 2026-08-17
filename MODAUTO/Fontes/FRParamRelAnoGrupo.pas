unit FRParamRelAnoGrupo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,
  TREdit, Mask, wwdbedit, Wwdbspin, Spin, MontaSelect, IvDictio, IvMulti,
  IvEMulti, wwdblook, Db, DBTables, Wwquery, CMDBLookupCombo, ComCtrls;

type
  TFrmRParamRelAnoGrupo = class(TfrmOkCancelar)
    qryCenRespConta: TwwQuery;
    qryCenRespContaNOME: TStringField;
    qryCenRespContaCODCENTRORESPON: TStringField;
    dblcCentRespConta: TwwDBLookupCombo;
    Label4: TLabel;
    qryExercicio: TwwQuery;
    qryExercicioEXERCICIO: TFloatField;
    dblkExercicio: TwwDBLookupCombo;
    Label3: TLabel;
    gbParametros: TGroupBox;
    sePosIni1: TwwDBSpinEdit;
    sePosFim1: TwwDBSpinEdit;
    edNome1: TEdit;
    edConteudo1: TEdit;
    sePosIni2: TwwDBSpinEdit;
    sePosFim2: TwwDBSpinEdit;
    edNome2: TEdit;
    edConteudo2: TEdit;
    sePosIni3: TwwDBSpinEdit;
    sePosFim3: TwwDBSpinEdit;
    edNome3: TEdit;
    edConteudo3: TEdit;
    sePosIni4: TwwDBSpinEdit;
    sePosFim4: TwwDBSpinEdit;
    edNome4: TEdit;
    edConteudo4: TEdit;
    Label2: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    qryCompSaldo: TwwQuery;
    qryPeriodos: TwwQuery;
    qryPeriodosPERIODO: TFloatField;
    qryPeriodosNOMEPERIODO: TStringField;
    dblcMoeda: TwwDBLookupCombo;
    Label6: TLabel;
    qryMoeda: TwwQuery;
    qryPeriodosDATAINIPERIODO: TDateTimeField;
    qryPeriodosDATAFIMPERIODO: TDateTimeField;
    Label10: TLabel;
    seGrauGrupo: TwwDBSpinEdit;
    dblcGrupoIni: TwwDBLookupCombo;
    qryGrupoIni: TwwQuery;
    qryGrupoFim: TwwQuery;
    dblcGrupoFim: TwwDBLookupCombo;
    Label11: TLabel;
    Label12: TLabel;
    qryGrupoFimCODGRUPOORC: TStringField;
    qryGrupoFimNOMEGRUPOORCAMEN: TStringField;
    qryGrupoIniCODGRUPOORC: TStringField;
    qryGrupoIniNOMEGRUPOORCAMEN: TStringField;
    qryCenario: TwwQuery;
    lblCenario: TLabel;
    dblcCenario: TCMDBLookupCombo;
    rgImpValores: TRadioGroup;
    pbAguarde: TProgressBar;
    bbtnGerarTXT: TBitBtn;
    ToolbarSep972: TToolbarSep97;
    qryGrupoOrc: TwwQuery;
    qryGrupoOrcIDGRUPOORCAMEN: TFloatField;
    cbZerados: TCheckBox;
    rgUsuXCCCR: TRadioGroup;
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure rgImpValoresClick(Sender: TObject);
    procedure bbtnGerarTXTClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    procedure FazMontaRelatorio;
  public
    { Public declarations }
  end;

var
  FrmRParamRelAnoGrupo: TFrmRParamRelAnoGrupo;

implementation

uses UMensErro, uDatabase, DBaseDados, uAutorizacao, uSistema,
     uModulo, uOrcamento, dRelatoriosModAuto, uData, uFuncaoGeral, uString;

{$R *.DFM}


{ -----------------------------------------------------------------------------}
{                                                                              }
{ Gráfico - Distribuição de Saldos por Grupo de Contas                         }
{                                                                              }
{ Autor : Antônio Jorge M.Rodrigues                                            }
{ Data de Início  : 24/02/00                                                   }
{ Data de Término : 24/02/00                                                   }
{ Última Revisão  : 24/02/00 (Antônio Jorge)                                   }
{                                                                              }
{ -----------------------------------------------------------------------------}



procedure TFrmRParamRelAnoGrupo.FormShow(Sender: TObject);
begin
   inherited;

   //Preenche as combo-boxes
   with qryExercicio do begin
      Prepare;
      ParamByName('IDPESSOA').asInteger := Sistema.idEmpresa;
      Open;
   end;
   with qryCenRespConta do begin
      Close;
      ParamByName('IDPESSOA').asInteger := sistema.idEmpresa;
      Open;
   end;
   with qryMoeda do begin
      Close;
      Open;
   end;
   with qryGrupoIni do begin
      Close;
      Open;
      First;
      dblcGrupoIni.LookupValue := qryGrupoIniCODGRUPOORC.AsString;
   end;
   with qryGrupoFim do begin
      Close;
      Open;
      Last;
      dblcGrupoFim.LookupValue := qryGrupoFimCODGRUPOORC.AsString;
   end;

   //
   seGrauGrupo.MaxValue := FuncaoGeral.CalcGrauMax(Modulo.sMascaraGrupo);
   seGrauGrupo.Value    := seGrauGrupo.MaxValue;
   seGrauGrupo.MinValue := 1;
   //
end;



procedure TFrmRParamRelAnoGrupo.FormActivate(Sender: TObject);
begin
  inherited;
  qryCenario.Close;
  qryCenario.Open;
end;

procedure TFrmRParamRelAnoGrupo.rgImpValoresClick(Sender: TObject);
begin
   inherited;
   if rgImpValores.ItemIndex = 2 then begin
      dblcCenario.Enabled := True;
   end else begin
      dblcCenario.Enabled     := False;
      dblcCenario.LookupValue := '';
      dblcCenario.Text        := '';
   end;
end;


procedure TFrmRParamRelAnoGrupo.FazMontaRelatorio;
var x, iNumDigGrau : Integer;
    sGrupos : String;
    bSair   : Boolean;
    rValCot, rValCot1, rValCot2, rValCot3, rValCot4, rValCot5, rValCot6 : Double;
    rValCot7, rValCot8, rValCot9, rValCot10, rValCot11, rValCot12 : Double;
begin
   iNumDigGrau := FuncaoGeral.CalcNumEleGrau(Modulo.sMascaraGrupo,StrToInt(FloatToStr(seGrauGrupo.Value)));
   //Filtra os dados da tela para passar a ordenação correta para o relatório
   if (rgImpValores.ItemIndex = 2) and (dblcCenario.Text = '') then begin
      MsgDlg('O Cenário deve ser preenchido.','Erro',mtError,[mbOk],0);
      ModalResult := mrNone;
      dblcCenario.SetFocus;
      exit;
   end;
   if trim(dblkExercicio.Text) = '' then begin
      MsgDlg('Obrigatório indicar o exercício.','Erro',mtError,[mbOk],0);
      ModalResult := mrNone;
   end else begin
      If rgImpValores.ItemIndex = 0 then
         dtmRelatoriosModAuto.ppLabel229.Caption  := dblkExercicio.Text+' - Orçado'
      else
         if rgImpValores.ItemIndex = 1 then
            dtmRelatoriosModAuto.ppLabel229.Caption  := dblkExercicio.Text+' - Realizado'
         else
            dtmRelatoriosModAuto.ppLabel229.Caption  := dblkExercicio.Text+' - '+dblcCenario.Text;
      if trim(edConteudo1.Text) <> '' then
         dtmRelatoriosModAuto.ppLabel231.Caption  := edNome1.Text+': '+edConteudo1.Text
      else
         dtmRelatoriosModAuto.ppLabel231.Caption  := '';
      if trim(edConteudo2.Text) <> '' then
         dtmRelatoriosModAuto.ppLabel232.Caption  := edNome2.Text+': '+edConteudo2.Text
      else
         dtmRelatoriosModAuto.ppLabel232.Caption  := '';
      if trim(edConteudo3.Text) <> '' then
         dtmRelatoriosModAuto.ppLabel233.Caption  := edNome3.Text+': '+edConteudo3.Text
      else
         dtmRelatoriosModAuto.ppLabel233.Caption  := '';
      if trim(edConteudo4.Text) <> '' then
         dtmRelatoriosModAuto.ppLabel234.Caption  := edNome4.Text+': '+edConteudo4.Text
      else
         dtmRelatoriosModAuto.ppLabel234.Caption  := '';
      if trim(dblcMoeda.Text) <> '' then
         dtmRelatoriosModAuto.ppLabel235.Caption  := 'Moeda: '+dblcMoeda.Text
      else
         dtmRelatoriosModAuto.ppLabel235.Caption  := '';
      if trim(dblcCentRespConta.Text) <> '' then
         dtmRelatoriosModAuto.ppLabel236.Caption  := 'C.Responsabilidade: '+dblcCentRespConta.Text
      else
         dtmRelatoriosModAuto.ppLabel236.Caption  := '';
      with qryPeriodos do begin
         rValCot  := 1;
         rValCot1 := 1;
         rValCot2 := 1;
         rValCot3 := 1;
         rValCot4 := 1;
         rValCot5 := 1;
         rValCot6 := 1;
         rValCot7 := 1;
         rValCot8 := 1;
         rValCot9 := 1;
         rValCot10:= 1;
         rValCot11:= 1;
         rValCot12:= 1;
         Close;
         ParamByName('IDPESSOA').asInteger   := Sistema.idEmpresa;
         ParamByName('EXERCICIO').asInteger  := StrToInt(dblkExercicio.text);
         Open;
         First;
         x:=0;
         While not EOF do begin
            if trim(dblcMoeda.Text) <> '' then
               rValCot := FuncaoGeral.TestaCotacaoMoeda(StrToInt(dblcMoeda.LookUpValue),qryPeriodosDATAFIMPERIODO.AsString,'N');
            if rValCot = 0 then
               rValCot := 1;
            x:=x+1;
            if x = 1 then begin
               dtmRelatoriosModAuto.ppLabel211.Caption := Copy(qryPeriodosNOMEPERIODO.AsString,1,3);
               rValCot1 := rValCot;
            end else begin
               if x = 2 then begin
                  dtmRelatoriosModAuto.ppLabel214.Caption := Copy(qryPeriodosNOMEPERIODO.AsString,1,3);
                  rValCot2 := rValCot;
               end else begin
                  if x = 3 then begin
                     dtmRelatoriosModAuto.ppLabel217.Caption := Copy(qryPeriodosNOMEPERIODO.AsString,1,3);
                     rValCot3 := rValCot;
                  end else begin
                     if x = 4 then begin
                        dtmRelatoriosModAuto.ppLabel220.Caption := Copy(qryPeriodosNOMEPERIODO.AsString,1,3);
                        rValCot4 := rValCot;
                     end else begin
                        if x = 5 then begin
                           dtmRelatoriosModAuto.ppLabel223.Caption := Copy(qryPeriodosNOMEPERIODO.AsString,1,3);
                           rValCot5 := rValCot;
                        end else begin
                           if x = 6 then begin
                              dtmRelatoriosModAuto.ppLabel226.Caption := Copy(qryPeriodosNOMEPERIODO.AsString,1,3);
                              rValCot6 := rValCot;
                           end else begin
                              if x = 7 then begin
                                 dtmRelatoriosModAuto.rpRelatGrupoAnualLabel1.Caption := Copy(qryPeriodosNOMEPERIODO.AsString,1,3);
                                 rValCot7 := rValCot;
                              end else begin
                                 if x = 8 then begin
                                    dtmRelatoriosModAuto.rpRelatGrupoAnualLabel2.Caption := Copy(qryPeriodosNOMEPERIODO.AsString,1,3);
                                    rValCot8 := rValCot;
                                 end else begin
                                    if x = 9 then begin
                                       dtmRelatoriosModAuto.rpRelatGrupoAnualLabel3.Caption := Copy(qryPeriodosNOMEPERIODO.AsString,1,3);
                                       rValCot9 := rValCot;
                                    end else begin
                                       if x = 10 then begin
                                          dtmRelatoriosModAuto.rpRelatGrupoAnualLabel4.Caption := Copy(qryPeriodosNOMEPERIODO.AsString,1,3);
                                          rValCot10 := rValCot;
                                       end else begin
                                          if x = 11 then begin
                                             dtmRelatoriosModAuto.rpRelatGrupoAnualLabel5.Caption := Copy(qryPeriodosNOMEPERIODO.AsString,1,3);
                                             rValCot11 := rValCot;
                                          end else begin
                                             if x = 12 then begin
                                                dtmRelatoriosModAuto.rpRelatGrupoAnualLabel6.Caption := Copy(qryPeriodosNOMEPERIODO.AsString,1,3);
                                                rValCot12 := rValCot;
                                             end;
                                          end;
                                       end;
                                    end;
                                 end;
                              end;
                           end;
                        end;
                     end;
                  end;
               end;
            end;
            Next;
         end;
      end;
      with dtmRelatoriosModAuto.qryRelatGrupoAnual do begin
         Close;
         ParamByName('NUMDIGGRAU').AsInteger := iNumDigGrau;
         ParamByName('CODGRUPOINI').AsString := Espaco(dblcGrupoIni.LookupValue,10);
         ParamByName('CODGRUPOFIM').AsString := Espaco(dblcGrupoFim.LookupValue,10);
         Open;
         //
         pbAguarde.Position := 0;
         pbAguarde.Max      := RecordCount;
         bSair              := False;
         First;
         While (not EOF) and (not bSair) do begin
            pbAguarde.Position := pbAguarde.Position + 1;
            sGrupos := '';
            qryGrupoOrc.Close;
            qryGrupoOrc.ParamByName('CODGRUPOORC').asString     := FieldByName('CODGRUPOORC').AsString+'%';
            qryGrupoOrc.Open;
            if qryGrupoOrc.IsEmpty then
               sGrupos := '0';
            while not qryGrupoOrc.Eof do begin
               if sGrupos = '' then
                  sGrupos := qryGrupoOrcIDGRUPOORCAMEN.AsString
               else
                  sGrupos := sGrupos + ','+qryGrupoOrcIDGRUPOORCAMEN.AsString;
               qryGrupoOrc.Next;
            end;
            //
            qryCompSaldo.Close;
            qryCompSaldo.SQL.Clear;
            if rgImpValores.ItemIndex <> 2 then begin
               qryCompSaldo.SQL.Add('SELECT                         ');
               qryCompSaldo.SQL.Add('   S.PERIODO, S.EXERCICIO, G.FLGSINALGRUPO,                                 ');
               if rgImpValores.ItemIndex = 0 then begin
                  qryCompSaldo.SQL.Add('   ROUND(DECODE(G.FLGSINALGRUPO,''P'',SUM(DECODE(S.VLRORCADO,NULL,0,DECODE(C.FLGSINALCONTA,''P'',S.VLRORCADO,(S.VLRORCADO*-1)))),          ');
                  qryCompSaldo.SQL.Add('          SUM(DECODE(S.VLRORCADO,NULL,0,DECODE(C.FLGSINALCONTA,''P'',S.VLRORCADO,(S.VLRORCADO*-1))))*-1),2) AS VALOR                       ');
               end else begin
                  qryCompSaldo.SQL.Add('   ROUND(DECODE(G.FLGSINALGRUPO,''P'',SUM(DECODE(S.VLRREALIZADO,NULL,0,DECODE(C.FLGSINALCONTA,''P'',S.VLRREALIZADO,(S.VLRREALIZADO*-1)))), ');
                  qryCompSaldo.SQL.Add('          SUM(DECODE(S.VLRREALIZADO,NULL,0,DECODE(C.FLGSINALCONTA,''P'',S.VLRREALIZADO,(S.VLRREALIZADO*-1))))*-1),2) AS VALOR              ');
               end;
               qryCompSaldo.SQL.Add('FROM                                                                        ');
               qryCompSaldo.SQL.Add('    GRUPOORCAMEN G,                                                         ');
               qryCompSaldo.SQL.Add('    CONTASORCAMEN C,                                                        ');
               qryCompSaldo.SQL.Add('    SALDOORCADO S                                                           ');
               qryCompSaldo.SQL.Add('WHERE                                                                       ');
               qryCompSaldo.SQL.Add('   (G.IDGRUPOORCAMEN IN ('+sGrupos+')) AND               ');
               qryCompSaldo.SQL.Add('   ((C.FLGATIVA = ''A'') OR (C.FLGATIVA IS NULL)) AND    ');
               qryCompSaldo.SQL.Add('   (S.EXERCICIO =:EXERCICIO) AND                         ');
               qryCompSaldo.SQL.Add('   (S.PERIODO BETWEEN 1 AND 12) AND                      ');
               qryCompSaldo.SQL.Add('   (S.IDPESSOA = :IDPESSOA) AND                                             ');
               if rgUsuXCCCR.ItemIndex = 0 then begin
                  qryCompSaldo.SQL.Add(' EXISTS (SELECT UXC.IDPESSOAACESSO                                           ');
                  qryCompSaldo.SQL.Add('         FROM PESSOAXCRESP UXC                                               ');
                  qryCompSaldo.SQL.Add('         WHERE (UXC.IDPESSOAACESSO = '+IntToStr(Sistema.idUsuario)+')        ');
                  qryCompSaldo.SQL.Add('           AND (UXC.CODCENTRORESPON = C.CODCENTRORESPON)                     ');
                  qryCompSaldo.SQL.Add('           AND (UXC.IDPESSOA = C.IDPESSOA)  ) AND                            ');
               end else begin
                  qryCompSaldo.SQL.Add(' EXISTS (SELECT UXC.IDUSUARIO                                                ');
                  qryCompSaldo.SQL.Add('         FROM USCCUSTO UXC, COMPCONTASORCAMEN CP                             ');
                  qryCompSaldo.SQL.Add('         WHERE (UXC.IDUSUARIO = '+IntToStr(Sistema.idUsuario)+')             ');
                  qryCompSaldo.SQL.Add('           AND (UXC.IDPESSOA = '+IntToStr(Sistema.idEmpresa)+')              ');
                  qryCompSaldo.SQL.Add('           AND (CP.IDCONTAORCAMEN = C.IDCONTAORCAMEN)                        ');
                  qryCompSaldo.SQL.Add('           AND (CP.IDPLANOORCAMEN = C.IDPLANOORCAMEN)                        ');
                  qryCompSaldo.SQL.Add('           AND (UXC.CODCENTROCUSTO = CP.CODCENTROCUSTO)                      ');
                  qryCompSaldo.SQL.Add('           AND (UXC.IDEMPRESA = CP.IDEMPRESA) GROUP BY UXC.IDUSUARIO ) AND   ');
               end;
               if dblcCentRespConta.text <> '' then begin
                  qryCompSaldo.SQL.Add('(C.CODCENTRORESPON LIKE '''+dblcCentRespConta.LookupValue+'%'+''') AND  ');
                  qryCompSaldo.SQL.Add('(C.IDPESSOA = :IDPESSOA) AND                                             ');
               end;
               if edConteudo1.Text <> '' then begin
                  qryCompSaldo.SQL.Add('(SUBSTR(S.IDCONTAORCAMEN,'+FloatToStr(sePosIni1.Value)+','+FloatToStr(sePosFim1.Value)+') IN ('+trim(edConteudo1.Text)+')) AND ');
               end;
               if edConteudo2.Text <> '' then begin
                  qryCompSaldo.SQL.Add('(SUBSTR(S.IDCONTAORCAMEN,'+FloatToStr(sePosIni2.Value)+','+FloatToStr(sePosFim2.Value)+') IN ('+trim(edConteudo2.Text)+')) AND ');
               end;
               if edConteudo3.Text <> '' then begin
                  qryCompSaldo.SQL.Add('(SUBSTR(S.IDCONTAORCAMEN,'+FloatToStr(sePosIni3.Value)+','+FloatToStr(sePosFim3.Value)+') IN ('+trim(edConteudo3.Text)+')) AND ');
               end;
               if edConteudo4.Text <> '' then begin
                  qryCompSaldo.SQL.Add('(SUBSTR(S.IDCONTAORCAMEN,'+FloatToStr(sePosIni4.Value)+','+FloatToStr(sePosFim4.Value)+') IN ('+trim(edConteudo4.Text)+')) AND ');
               end;
               qryCompSaldo.SQL.Add('   (C.IDPLANOORCAMEN = S.IDPLANOORCAMEN) AND                                ');
               qryCompSaldo.SQL.Add('   (C.IDCONTAORCAMEN = S.IDCONTAORCAMEN) AND                                ');
               qryCompSaldo.SQL.Add('   (C.IDGRUPOORCAMEN = G.IDGRUPOORCAMEN)                                    ');
               qryCompSaldo.SQL.Add('GROUP BY                                                                    ');
               qryCompSaldo.SQL.Add('   S.PERIODO, S.EXERCICIO, G.FLGSINALGRUPO                                  ');
               qryCompSaldo.SQL.Add('ORDER  BY                                                                   ');
               qryCompSaldo.SQL.Add('   S.EXERCICIO, S.PERIODO                                                   ');
            end else begin
               qryCompSaldo.SQL.Add('SELECT                         ');
               qryCompSaldo.SQL.Add('   S.PERIODO, S.EXERCICIO, G.FLGSINALGRUPO,                                 ');
               qryCompSaldo.SQL.Add('   ROUND(DECODE(G.FLGSINALGRUPO,''P'',SUM(DECODE(S.VLRORCCENARIO,NULL,0,DECODE(C.FLGSINALCONTA,''P'',S.VLRORCCENARIO,(S.VLRORCCENARIO*-1)))), ');
               qryCompSaldo.SQL.Add('          SUM(DECODE(S.VLRORCCENARIO,NULL,0,DECODE(C.FLGSINALCONTA,''P'',S.VLRORCCENARIO,(S.VLRORCCENARIO*-1))))*-1),2) AS VALOR              ');
               qryCompSaldo.SQL.Add('FROM                                                                        ');
               qryCompSaldo.SQL.Add('    GRUPOORCAMEN G,                                                         ');
               qryCompSaldo.SQL.Add('    CONTASORCAMEN C,                                                        ');
               qryCompSaldo.SQL.Add('    VALORESCENARIO S                                                        ');
               qryCompSaldo.SQL.Add('WHERE                                                                       ');
               qryCompSaldo.SQL.Add('   (G.IDGRUPOORCAMEN IN ('+sGrupos+')) AND              ');
               qryCompSaldo.SQL.Add('   ((C.FLGATIVA = ''A'') OR (C.FLGATIVA IS NULL)) AND    ');
               qryCompSaldo.SQL.Add('   (S.EXERCICIO =:EXERCICIO) AND                                            ');
               qryCompSaldo.SQL.Add('   (S.PERIODO BETWEEN 1 AND 12) AND                      ');
               qryCompSaldo.SQL.Add('   (S.IDPESSOA = :IDPESSOA) AND                                             ');
               qryCompSaldo.SQL.Add('   (S.IDCENARIOORCAMEN = '+dblcCenario.LookupValue+') AND                   ');
               if rgUsuXCCCR.ItemIndex = 0 then begin
                  qryCompSaldo.SQL.Add(' EXISTS (SELECT UXC.IDPESSOAACESSO                                           ');
                  qryCompSaldo.SQL.Add('         FROM PESSOAXCRESP UXC                                               ');
                  qryCompSaldo.SQL.Add('         WHERE (UXC.IDPESSOAACESSO = '+IntToStr(Sistema.idUsuario)+')        ');
                  qryCompSaldo.SQL.Add('           AND (UXC.CODCENTRORESPON = C.CODCENTRORESPON)                     ');
                  qryCompSaldo.SQL.Add('           AND (UXC.IDPESSOA = C.IDPESSOA)  ) AND                            ');
               end else begin
                  qryCompSaldo.SQL.Add(' EXISTS (SELECT UXC.IDUSUARIO                                                ');
                  qryCompSaldo.SQL.Add('         FROM USCCUSTO UXC, COMPCONTASORCAMEN CP                             ');
                  qryCompSaldo.SQL.Add('         WHERE (UXC.IDUSUARIO = '+IntToStr(Sistema.idUsuario)+')             ');
                  qryCompSaldo.SQL.Add('           AND (UXC.IDPESSOA = '+IntToStr(Sistema.idEmpresa)+')              ');
                  qryCompSaldo.SQL.Add('           AND (CP.IDCONTAORCAMEN = C.IDCONTAORCAMEN)                        ');
                  qryCompSaldo.SQL.Add('           AND (CP.IDPLANOORCAMEN = C.IDPLANOORCAMEN)                        ');
                  qryCompSaldo.SQL.Add('           AND (UXC.CODCENTROCUSTO = CP.CODCENTROCUSTO)                      ');
                  qryCompSaldo.SQL.Add('           AND (UXC.IDEMPRESA = CP.IDEMPRESA) GROUP BY UXC.IDUSUARIO ) AND   ');
               end;
               if dblcCentRespConta.text <> '' then begin
                  qryCompSaldo.SQL.Add('(C.CODCENTRORESPON LIKE '''+dblcCentRespConta.LookupValue+'%'+''') AND  ');
                  qryCompSaldo.SQL.Add('(C.IDPESSOA = :IDPESSOA) AND                                             ');
               end;
               if edConteudo1.Text <> '' then begin
                  qryCompSaldo.SQL.Add('(SUBSTR(S.IDCONTAORCAMEN,'+FloatToStr(sePosIni1.Value)+','+FloatToStr(sePosFim1.Value)+') IN ('+trim(edConteudo1.Text)+')) AND ');
               end;
               if edConteudo2.Text <> '' then begin
                  qryCompSaldo.SQL.Add('(SUBSTR(S.IDCONTAORCAMEN,'+FloatToStr(sePosIni2.Value)+','+FloatToStr(sePosFim2.Value)+') IN ('+trim(edConteudo2.Text)+')) AND ');
               end;
               if edConteudo3.Text <> '' then begin
                  qryCompSaldo.SQL.Add('(SUBSTR(S.IDCONTAORCAMEN,'+FloatToStr(sePosIni3.Value)+','+FloatToStr(sePosFim3.Value)+') IN ('+trim(edConteudo3.Text)+')) AND ');
               end;
               if edConteudo4.Text <> '' then begin
                  qryCompSaldo.SQL.Add('(SUBSTR(S.IDCONTAORCAMEN,'+FloatToStr(sePosIni4.Value)+','+FloatToStr(sePosFim4.Value)+') IN ('+trim(edConteudo4.Text)+')) AND ');
               end;
               qryCompSaldo.SQL.Add('   (C.IDPLANOORCAMEN = S.IDPLANOORCAMEN) AND                                ');
               qryCompSaldo.SQL.Add('   (C.IDCONTAORCAMEN = S.IDCONTAORCAMEN) AND                                ');
               qryCompSaldo.SQL.Add('   (C.IDGRUPOORCAMEN = G.IDGRUPOORCAMEN)                                    ');
               qryCompSaldo.SQL.Add('GROUP BY                                                                    ');
               qryCompSaldo.SQL.Add('   S.PERIODO, S.EXERCICIO, G.FLGSINALGRUPO                                  ');
            end;
            qryCompSaldo.ParamByName('IDPESSOA').asInteger       := Sistema.idEmpresa;
            qryCompSaldo.ParamByName('EXERCICIO').asInteger      := StrToInt(dblkExercicio.text);
            qryCompSaldo.Open;
            qryCompSaldo.First;
            Edit;
            While not qryCompSaldo.EOF do begin
               x:=0;
               qryPeriodos.First;
               While not qryPeriodos.EOF do begin
                  x:=x+1;
                  if qryCompSaldo.FieldByName('PERIODO').AsInteger = x then begin
                     if x = 1 then begin
                        FieldByName('VAL01').AsFloat := FieldByName('VAL01').AsFloat + qryCompSaldo.FieldByName('VALOR').AsFloat/rValCot1;
                        Break;
                     end;
                     if x = 2 then begin
                        FieldByName('VAL02').AsFloat := FieldByName('VAL02').AsFloat + qryCompSaldo.FieldByName('VALOR').AsFloat/rValCot2;
                        Break;
                     end;
                     if x = 3 then begin
                        FieldByName('VAL03').AsFloat := FieldByName('VAL03').AsFloat + qryCompSaldo.FieldByName('VALOR').AsFloat/rValCot3;
                        Break;
                     end;
                     if x = 4 then begin
                        FieldByName('VAL04').AsFloat := FieldByName('VAL04').AsFloat + qryCompSaldo.FieldByName('VALOR').AsFloat/rValCot4;
                        Break;
                     end;
                     if x = 5 then begin
                        FieldByName('VAL05').AsFloat := FieldByName('VAL05').AsFloat + qryCompSaldo.FieldByName('VALOR').AsFloat/rValCot5;
                        Break;
                     end;
                     if x = 6 then begin
                        FieldByName('VAL06').AsFloat := FieldByName('VAL06').AsFloat + qryCompSaldo.FieldByName('VALOR').AsFloat/rValCot6;
                        Break;
                     end;
                     if x = 7 then begin
                        FieldByName('VAL07').AsFloat := FieldByName('VAL07').AsFloat + qryCompSaldo.FieldByName('VALOR').AsFloat/rValCot7;
                        Break;
                     end;
                     if x = 8 then begin
                        FieldByName('VAL08').AsFloat := FieldByName('VAL08').AsFloat + qryCompSaldo.FieldByName('VALOR').AsFloat/rValCot8;
                        Break;
                     end;
                     if x = 9 then begin
                        FieldByName('VAL09').AsFloat := FieldByName('VAL09').AsFloat + qryCompSaldo.FieldByName('VALOR').AsFloat/rValCot9;
                        Break;
                     end;
                     if x = 10 then begin
                        FieldByName('VAL10').AsFloat := FieldByName('VAL10').AsFloat + qryCompSaldo.FieldByName('VALOR').AsFloat/rValCot10;
                        Break;
                     end;
                     if x = 11 then begin
                        FieldByName('VAL11').AsFloat := FieldByName('VAL11').AsFloat + qryCompSaldo.FieldByName('VALOR').AsFloat/rValCot11;
                        Break;
                     end;
                     if x = 12 then begin
                        FieldByName('VAL12').AsFloat := FieldByName('VAL12').AsFloat + qryCompSaldo.FieldByName('VALOR').AsFloat/rValCot12;
                        Break;
                     end;
                  end;
                  qryPeriodos.Next;
               end;
               qryCompSaldo.Next;
            end;
            FieldByName('TOTAL').AsFloat := FieldByName('VAL01').AsFloat + FieldByName('VAL02').AsFloat  + FieldByName('VAL03').AsFloat + FieldByName('VAL04').AsFloat + FieldByName('VAL05').AsFloat + FieldByName('VAL06').AsFloat+
                                            FieldByName('VAL07').AsFloat + FieldByName('VAL08').AsFloat  + FieldByName('VAL09').AsFloat + FieldByName('VAL10').AsFloat + FieldByName('VAL11').AsFloat + FieldByName('VAL12').AsFloat;
            if not cbZerados.Checked then begin
               if (FieldByName('VAL01').AsFloat = 0) and
                  (FieldByName('VAL02').AsFloat = 0) and
                  (FieldByName('VAL03').AsFloat = 0) and
                  (FieldByName('VAL04').AsFloat = 0) and
                  (FieldByName('VAL05').AsFloat = 0) and
                  (FieldByName('VAL06').AsFloat = 0) and
                  (FieldByName('VAL07').AsFloat = 0) and
                  (FieldByName('VAL08').AsFloat = 0) and
                  (FieldByName('VAL09').AsFloat = 0) and
                  (FieldByName('VAL10').AsFloat = 0) and
                  (FieldByName('VAL11').AsFloat = 0) and
                  (FieldByName('VAL12').AsFloat = 0) then begin
                  Next;
                  if Eof then
                     bSair := True
                  else
                     Prior;
                  Delete;
               end else begin
                  Post;
                  Next;
               end;
            end else begin
               Post;
               Next;
            end;
         end;
      end;
   end;
end;


procedure TFrmRParamRelAnoGrupo.bbtnGerarTXTClick(Sender: TObject);
var sNomeArquivo, sLinha: string;
    iTamanho: integer;
    ArquivoTexto : TextFile;
begin
   inherited;
   sNomeArquivo := 'ORC' + FormatDateTime('yyyymmdd', date) + '.TXT';
   if MsgDlg('Será Gerado um arquivo chamado ' + sNomeArquivo + ' no diretório corrente. Deseja prosseguir?','Aviso',mtConfirmation,[mbYes, mbNo],0) = mrYes then begin
      //Cria Um Novo Arquivo ou Sobrescreve um já existente
      screen.cursor := crHourglass;
      AssignFile(ArquivoTexto, sNomeArquivo);
      ReWrite(Arquivotexto);
      FazMontaRelatorio;
      //Gera o Cabeçalho do arquivo texto
      sLinha := 'Exercício: '+dtmRelatoriosModAuto.ppLabel229.Caption+' ';
      if trim(dblcMoeda.Text) <> '' then
         sLinha := sLinha + 'Moeda: '+dblcMoeda.Text+' ';
      if trim(dblcCentRespConta.Text) <> '' then
         sLinha := sLinha + 'Moeda: '+'C.Responsabilidade: '+dblcCentRespConta.Text;
      WriteLn(ArquivoTexto, sLinha);
      sLinha := '';
      if trim(edConteudo1.Text) <> '' then
         sLinha := sLinha + edNome1.Text+': '+edConteudo1.Text+' ';
      if trim(edConteudo2.Text) <> '' then
         sLinha := sLinha + edNome2.Text+': '+edConteudo2.Text+' ';
      if trim(edConteudo3.Text) <> '' then
         sLinha := sLinha + edNome3.Text+': '+edConteudo3.Text+' ';
      if trim(edConteudo4.Text) <> '' then
         sLinha := sLinha + edNome4.Text+': '+edConteudo4.Text+' ';
      if sLinha <> '' then
         WriteLn(ArquivoTexto, sLinha);
      WriteLn(ArquivoTexto, ' ');

      with dtmRelatoriosModAuto.qryRelatGrupoAnual do begin
         pbAguarde.Position := 0;
         pbAguarde.Max      := RecordCount;
         First;
         While not EOF do begin
            pbAguarde.Position := pbAguarde.Position + 1;
            sLinha := '';
            //
            //Concatena o Código do Grupo
            iTamanho := length(FieldByName('CODGRUPOORC').asString);
            sLinha := sLinha + FieldByName('CODGRUPOORC').asString + FuncaoGeral.spc(10-iTamanho);
            //Concatena o Nome do Grupo
            iTamanho := length(FieldByName('NOMEGRUPOORCAMEN').asString);
            sLinha := sLinha + FieldByName('NOMEGRUPOORCAMEN').asString + FuncaoGeral.spc(60-iTamanho);
            //Concatena os Valores
            sLinha := sLinha + FuncaoGeral.AD(FormatFloat('0.00', FieldByName('VAL01').AsFloat), 20);
            sLinha := sLinha + FuncaoGeral.AD(FormatFloat('0.00', FieldByName('VAL02').AsFloat), 20);
            sLinha := sLinha + FuncaoGeral.AD(FormatFloat('0.00', FieldByName('VAL03').AsFloat), 20);
            sLinha := sLinha + FuncaoGeral.AD(FormatFloat('0.00', FieldByName('VAL04').AsFloat), 20);
            sLinha := sLinha + FuncaoGeral.AD(FormatFloat('0.00', FieldByName('VAL05').AsFloat), 20);
            sLinha := sLinha + FuncaoGeral.AD(FormatFloat('0.00', FieldByName('VAL06').AsFloat), 20);
            sLinha := sLinha + FuncaoGeral.AD(FormatFloat('0.00', FieldByName('VAL07').AsFloat), 20);
            sLinha := sLinha + FuncaoGeral.AD(FormatFloat('0.00', FieldByName('VAL08').AsFloat), 20);
            sLinha := sLinha + FuncaoGeral.AD(FormatFloat('0.00', FieldByName('VAL09').AsFloat), 20);
            sLinha := sLinha + FuncaoGeral.AD(FormatFloat('0.00', FieldByName('VAL10').AsFloat), 20);
            sLinha := sLinha + FuncaoGeral.AD(FormatFloat('0.00', FieldByName('VAL11').AsFloat), 20);
            sLinha := sLinha + FuncaoGeral.AD(FormatFloat('0.00', FieldByName('VAL12').AsFloat), 20);
            sLinha := sLinha + FuncaoGeral.AD(FormatFloat('0.00', FieldByName('TOTAL').AsFloat), 20);
            WriteLn(ArquivoTexto, sLinha);
            Next;
         end;
      end;
      CloseFile(ArquivoTexto);
      screen.cursor := crDefault;
      MsgDlg('Arquivo gerado com sucesso.','Aviso',mtInformation,[mbOk],0);
      modalResult := mrNone;
   end;
end;

procedure TFrmRParamRelAnoGrupo.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
   FazMontaRelatorio;
end;


{SELECT
   S.PERIODO, S.EXERCICIO, G.FLGSINALGRUPO,
   ROUND(SUM(DECODE(S.VLRORCADO,NULL,0,DECODE(C.FLGSINALCONTA,'P',S.VLRORCADO,(S.VLRORCADO*-1)))),2) AS VLRORCADOS,
   ROUND(SUM(DECODE(S.VLRREALIZADO,NULL,0,DECODE(C.FLGSINALCONTA,'P',S.VLRREALIZADO,(S.VLRREALIZADO*-1)))),2) AS VLRREALIZADOS,
   ROUND(DECODE(G.FLGSINALGRUPO,'P',SUM(DECODE(S.VLRORCADO,NULL,0,DECODE(C.FLGSINALCONTA,'P',S.VLRORCADO,(S.VLRORCADO*-1)))),
          SUM(DECODE(S.VLRORCADO,NULL,0,DECODE(C.FLGSINALCONTA,'P',S.VLRORCADO,(S.VLRORCADO*-1))))*-1),2) AS VLRORCADO,
   ROUND(DECODE(G.FLGSINALGRUPO,'P',SUM(DECODE(S.VLRREALIZADO,NULL,0,DECODE(C.FLGSINALCONTA,'P',S.VLRREALIZADO,(S.VLRREALIZADO*-1)))),
          SUM(DECODE(S.VLRREALIZADO,NULL,0,DECODE(C.FLGSINALCONTA,'P',S.VLRREALIZADO,(S.VLRREALIZADO*-1))))*-1),2) AS VLRREALIZADO
FROM
    CONTASORCAMEN C,
    GRUPOORCAMEN G,
    SALDOORCADO S
WHERE
   (S.EXERCICIO =2000) AND
   (S.PERIODO BETWEEN 1 AND 6) AND
   (S.IDPESSOA = 1) AND
   (G.CODGRUPOORC LIKE '01%') AND
   (C.IDPLANOORCAMEN = S.IDPLANOORCAMEN) AND
   (C.IDCONTAORCAMEN = S.IDCONTAORCAMEN) AND
   (C.IDGRUPOORCAMEN = G.IDGRUPOORCAMEN)
GROUP BY
   S.PERIODO, S.EXERCICIO, G.FLGSINALGRUPO
ORDER  BY
   S.EXERCICIO, S.PERIODO
 }



{SELECT
   U.PERIODO, U.EXERCICIO, U.FLGSINALGRUPO,
   SUM(U.VLRORCADOS) AS VLRORCADOS,
   SUM(U.VLRREALIZADOS) AS VLRREALIZADOS,
   SUM(U.VLRORCADO) AS VLRORCADO,
   SUM(U.VLRREALIZADO) AS VLRREALIZADO
FROM
(SELECT
   S.PERIODO, S.EXERCICIO, G.FLGSINALGRUPO,
   (0) AS VLRORCADOS,
   ROUND(SUM(DECODE(S.VLRREALIZADO,NULL,0,DECODE(C.FLGSINALCONTA,'P',S.VLRREALIZADO,(S.VLRREALIZADO*-1)))),2) AS VLRREALIZADOS,
   (0) AS VLRORCADO,
   ROUND(DECODE(G.FLGSINALGRUPO,'P',SUM(DECODE(S.VLRREALIZADO,NULL,0,DECODE(C.FLGSINALCONTA,'P',S.VLRREALIZADO,(S.VLRREALIZADO*-1)))),
          SUM(DECODE(S.VLRREALIZADO,NULL,0,DECODE(C.FLGSINALCONTA,'P',S.VLRREALIZADO,(S.VLRREALIZADO*-1))))*-1),2) AS VLRREALIZADO
FROM
    CONTASORCAMEN C,
    GRUPOORCAMEN G,
    SALDOORCADO S
WHERE
   (S.EXERCICIO =2000) AND
   (S.PERIODO BETWEEN 1 AND 6) AND
   (S.IDPESSOA = 1) AND
   (G.CODGRUPOORC LIKE '01%') AND
   (C.IDPLANOORCAMEN = S.IDPLANOORCAMEN) AND
   (C.IDCONTAORCAMEN = S.IDCONTAORCAMEN) AND
   (C.IDGRUPOORCAMEN = G.IDGRUPOORCAMEN)
GROUP BY
   S.PERIODO, S.EXERCICIO, G.FLGSINALGRUPO
UNION ALL
SELECT
   S.PERIODO, S.EXERCICIO, G.FLGSINALGRUPO,
   ROUND(SUM(DECODE(S.VLRORCCENARIO,NULL,0,DECODE(C.FLGSINALCONTA,'P',S.VLRORCCENARIO,(S.VLRORCCENARIO*-1)))),2) AS VLRORCADOS,
   (0) AS VLRREALIZADOS,
   ROUND(DECODE(G.FLGSINALGRUPO,'P',SUM(DECODE(S.VLRORCCENARIO,NULL,0,DECODE(C.FLGSINALCONTA,'P',S.VLRORCCENARIO,(S.VLRORCCENARIO*-1)))),
          SUM(DECODE(S.VLRORCCENARIO,NULL,0,DECODE(C.FLGSINALCONTA,'P',S.VLRORCCENARIO,(S.VLRORCCENARIO*-1))))*-1),2) AS VLRORCADO,
   (0) AS VLRREALIZADO
FROM
    CONTASORCAMEN C,
    GRUPOORCAMEN G,
    VALORESCENARIO S
WHERE
   (S.EXERCICIO =2000) AND
   (S.PERIODO BETWEEN 1 AND 6) AND
   (S.IDPESSOA = 1) AND
   (G.CODGRUPOORC LIKE '01%') AND
   (S.IDCENARIOORCAMEN = 1) AND
   (C.IDPLANOORCAMEN = S.IDPLANOORCAMEN) AND
   (C.IDCONTAORCAMEN = S.IDCONTAORCAMEN) AND
   (C.IDGRUPOORCAMEN = G.IDGRUPOORCAMEN)
GROUP BY
   S.PERIODO, S.EXERCICIO, G.FLGSINALGRUPO  ) U
GROUP BY
   U.PERIODO, U.EXERCICIO, U.FLGSINALGRUPO
ORDER  BY
   U.EXERCICIO, U.PERIODO
 }

end.

 
