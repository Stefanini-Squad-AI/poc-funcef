unit FRParamRelGrupo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,
  TREdit, Mask, wwdbedit, Wwdbspin, Spin, MontaSelect, IvDictio, IvMulti,
  IvEMulti, wwdblook, Db, DBTables, Wwquery, CMDBLookupCombo, ComCtrls;

type
  TFrmRParamRelGrupo = class(TfrmOkCancelar)
    qryCenRespConta: TwwQuery;
    qryCenRespContaNOME: TStringField;
    qryCenRespContaCODCENTRORESPON: TStringField;
    dblcCentRespConta: TwwDBLookupCombo;
    Label4: TLabel;
    qryExercicio: TwwQuery;
    qryExercicioEXERCICIO: TFloatField;
    qryPeriodoIni: TwwQuery;
    qryPeriodoIniPERIODO: TFloatField;
    qryPeriodoIniNOMEPERIODO: TStringField;
    dblkExercicio: TwwDBLookupCombo;
    Label3: TLabel;
    dblkPeriodoIni: TwwDBLookupCombo;
    Label1: TLabel;
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
    pbAguarde: TProgressBar;
    qryGrupoOrc: TwwQuery;
    qryGrupoOrcIDGRUPOORCAMEN: TFloatField;
    cbZerados: TCheckBox;
    rgUsuXCCCR: TRadioGroup;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dblkExercicioClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRParamRelGrupo: TFrmRParamRelGrupo;

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



procedure TFrmRParamRelGrupo.bbtnConfirmarClick(Sender: TObject);
var x, iNumDigGrau : Integer;
    rValCot, rValCot1, rValCot2, rValCot3, rValCot4, rValCot5, rValCot6 : Double;
    sGrupos : String;
    bSair   : Boolean;
begin
   iNumDigGrau := FuncaoGeral.CalcNumEleGrau(Modulo.sMascaraGrupo,StrToInt(FloatToStr(seGrauGrupo.Value)));
   //Filtra os dados da tela para passar a ordenação correta para o relatório
   if (dblkPeriodoIni.text = '') then begin
      MsgDlg('O Período deve ser preenchido.','Erro',mtError,[mbOk],0);
      ModalResult := mrNone;
   end else begin
      if OrcamentoBack.DiasNoPeriodo(StrToInt(dblkExercicio.text), StrToInt(dblkPeriodoIni.lookupvalue)) = 0 then begin
         MsgDlg('O Período Inicial não existe para o Exercício selecionado.','Erro',mtError,[mbOk],0);
         ModalResult := mrNone;
      end else begin
         If trim(dblcCenario.Text) = '' then
            dtmRelatoriosModAuto.rpRelatGrupoLabel21.Caption  := dblkExercicio.Text
         else
            dtmRelatoriosModAuto.rpRelatGrupoLabel21.Caption  := dblkExercicio.Text+' - '+dblcCenario.Text;
         if trim(edConteudo1.Text) <> '' then
            dtmRelatoriosModAuto.rpRelatGrupoLabel23.Caption  := edNome1.Text+': '+edConteudo1.Text
         else
            dtmRelatoriosModAuto.rpRelatGrupoLabel23.Caption  := '';
         if trim(edConteudo2.Text) <> '' then
            dtmRelatoriosModAuto.rpRelatGrupoLabel24.Caption  := edNome2.Text+': '+edConteudo2.Text
         else
            dtmRelatoriosModAuto.rpRelatGrupoLabel24.Caption  := '';
         if trim(edConteudo3.Text) <> '' then
            dtmRelatoriosModAuto.rpRelatGrupoLabel25.Caption  := edNome3.Text+': '+edConteudo3.Text
         else
            dtmRelatoriosModAuto.rpRelatGrupoLabel25.Caption  := '';
         if trim(edConteudo4.Text) <> '' then
            dtmRelatoriosModAuto.rpRelatGrupoLabel26.Caption  := edNome4.Text+': '+edConteudo4.Text
         else
            dtmRelatoriosModAuto.rpRelatGrupoLabel26.Caption  := '';
         if trim(dblcMoeda.Text) <> '' then
            dtmRelatoriosModAuto.rpRelatGrupoLabel27.Caption  := 'Moeda: '+dblcMoeda.Text
         else
            dtmRelatoriosModAuto.rpRelatGrupoLabel27.Caption  := '';
         if trim(dblcCentRespConta.Text) <> '' then
            dtmRelatoriosModAuto.rpRelatGrupoLabel28.Caption  := 'C.Responsabilidade: '+dblcCentRespConta.Text
         else
            dtmRelatoriosModAuto.rpRelatGrupoLabel28.Caption  := '';
         with qryPeriodos do begin
            rValCot  := 1;
            rValCot1 := 1;
            rValCot2 := 1;
            rValCot3 := 1;
            rValCot4 := 1;
            rValCot5 := 1;
            rValCot6 := 1;
            Close;
            ParamByName('IDPESSOA').asInteger   := Sistema.idEmpresa;
            ParamByName('EXERCICIO').asInteger  := StrToInt(dblkExercicio.text);
            ParamByName('PERIODOINI').asInteger := StrToInt(dblkPeriodoIni.lookupvalue);
            ParamByName('PERIODOFIM').asInteger := StrToInt(dblkPeriodoIni.lookupvalue)+5;
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
                  dtmRelatoriosModAuto.rpRelatGrupoLabel3.Caption := Copy(qryPeriodosNOMEPERIODO.AsString,1,3);
                  rValCot1 := rValCot;
               end else begin
                  if x = 2 then begin
                     dtmRelatoriosModAuto.rpRelatGrupoLabel6.Caption := Copy(qryPeriodosNOMEPERIODO.AsString,1,3);
                     rValCot2 := rValCot;
                  end else begin
                     if x = 3 then begin
                        dtmRelatoriosModAuto.rpRelatGrupoLabel9.Caption := Copy(qryPeriodosNOMEPERIODO.AsString,1,3);
                        rValCot3 := rValCot;
                     end else begin
                        if x = 4 then begin
                           dtmRelatoriosModAuto.rpRelatGrupoLabel12.Caption := Copy(qryPeriodosNOMEPERIODO.AsString,1,3);
                           rValCot4 := rValCot;
                        end else begin
                           if x = 5 then begin
                              dtmRelatoriosModAuto.rpRelatGrupoLabel15.Caption := Copy(qryPeriodosNOMEPERIODO.AsString,1,3);
                              rValCot5 := rValCot;
                           end else begin
                              if x = 6 then begin
                                 dtmRelatoriosModAuto.rpRelatGrupoLabel18.Caption := Copy(qryPeriodosNOMEPERIODO.AsString,1,3);
                                 rValCot6 := rValCot;
                              end;
                           end;
                        end;
                     end;
                  end;
               end;
               Next;
            end;
         end;
         with dtmRelatoriosModAuto.qryRelatGrupo do begin
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
               //
               qryGrupoOrc.Close;
               qryGrupoOrc.ParamByName('CODGRUPOORC').asString     := FieldByName('CODGRUPOORC').AsString+'%';
               qryGrupoOrc.Open;
               sGrupos := '';
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
               if trim(dblcCenario.Text) = '' then begin
                  qryCompSaldo.SQL.Add('SELECT                         ');
                  qryCompSaldo.SQL.Add('   S.PERIODO, S.EXERCICIO, G.FLGSINALGRUPO,                                 ');
                  qryCompSaldo.SQL.Add('   ROUND(SUM(DECODE(S.VLRORCADO,NULL,0,DECODE(C.FLGSINALCONTA,''P'',S.VLRORCADO,(S.VLRORCADO*-1)))),2) AS VLRORCADOS,                      ');
                  qryCompSaldo.SQL.Add('   ROUND(SUM(DECODE(S.VLRREALIZADO,NULL,0,DECODE(C.FLGSINALCONTA,''P'',S.VLRREALIZADO,(S.VLRREALIZADO*-1)))),2) AS VLRREALIZADOS,          ');
                  qryCompSaldo.SQL.Add('   ROUND(DECODE(G.FLGSINALGRUPO,''P'',SUM(DECODE(S.VLRORCADO,NULL,0,DECODE(C.FLGSINALCONTA,''P'',S.VLRORCADO,(S.VLRORCADO*-1)))),          ');
                  qryCompSaldo.SQL.Add('          SUM(DECODE(S.VLRORCADO,NULL,0,DECODE(C.FLGSINALCONTA,''P'',S.VLRORCADO,(S.VLRORCADO*-1))))*-1),2) AS VLRORCADO,                  ');
                  qryCompSaldo.SQL.Add('   ROUND(DECODE(G.FLGSINALGRUPO,''P'',SUM(DECODE(S.VLRREALIZADO,NULL,0,DECODE(C.FLGSINALCONTA,''P'',S.VLRREALIZADO,(S.VLRREALIZADO*-1)))), ');
                  qryCompSaldo.SQL.Add('          SUM(DECODE(S.VLRREALIZADO,NULL,0,DECODE(C.FLGSINALCONTA,''P'',S.VLRREALIZADO,(S.VLRREALIZADO*-1))))*-1),2) AS VLRREALIZADO       ');
                  qryCompSaldo.SQL.Add('FROM                                                                        ');
                  qryCompSaldo.SQL.Add('    GRUPOORCAMEN G,                                                         ');
                  qryCompSaldo.SQL.Add('    CONTASORCAMEN C,                                                        ');
                  qryCompSaldo.SQL.Add('    SALDOORCADO S                                                           ');
                  qryCompSaldo.SQL.Add('WHERE                                                                       ');
                  qryCompSaldo.SQL.Add('   (G.IDGRUPOORCAMEN IN ('+sGrupos+')) AND              ');
                  qryCompSaldo.SQL.Add('   ((C.FLGATIVA = ''A'') OR (C.FLGATIVA IS NULL)) AND   ');
                  qryCompSaldo.SQL.Add('   (S.EXERCICIO =:EXERCICIO) AND                                            ');
                  qryCompSaldo.SQL.Add('   (S.PERIODO BETWEEN :PERIODOINI AND :PERIODOFIM) AND                      ');
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
                  qryCompSaldo.SQL.Add('SELECT                                                                      ');
                  qryCompSaldo.SQL.Add('   U.PERIODO, U.EXERCICIO, U.FLGSINALGRUPO,                                 ');
                  qryCompSaldo.SQL.Add('   SUM(U.VLRORCADOS) AS VLRORCADOS,                                         ');
                  qryCompSaldo.SQL.Add('   SUM(U.VLRREALIZADOS) AS VLRREALIZADOS,                                   ');
                  qryCompSaldo.SQL.Add('   SUM(U.VLRORCADO) AS VLRORCADO,                                           ');
                  qryCompSaldo.SQL.Add('   SUM(U.VLRREALIZADO) AS VLRREALIZADO                                      ');
                  qryCompSaldo.SQL.Add('FROM                                                                        ');
                  qryCompSaldo.SQL.Add('(SELECT                        ');
                  qryCompSaldo.SQL.Add('   S.PERIODO, S.EXERCICIO, G.FLGSINALGRUPO,                                 ');
                  qryCompSaldo.SQL.Add('   (0) AS VLRORCADOS,                                                       ');
                  qryCompSaldo.SQL.Add('   ROUND(SUM(DECODE(S.VLRREALIZADO,NULL,0,DECODE(C.FLGSINALCONTA,''P'',S.VLRREALIZADO,(S.VLRREALIZADO*-1)))),2) AS VLRREALIZADOS,          ');
                  qryCompSaldo.SQL.Add('   (0) AS VLRORCADO,                                                        ');
                  qryCompSaldo.SQL.Add('   ROUND(DECODE(G.FLGSINALGRUPO,''P'',SUM(DECODE(S.VLRREALIZADO,NULL,0,DECODE(C.FLGSINALCONTA,''P'',S.VLRREALIZADO,(S.VLRREALIZADO*-1)))), ');
                  qryCompSaldo.SQL.Add('          SUM(DECODE(S.VLRREALIZADO,NULL,0,DECODE(C.FLGSINALCONTA,''P'',S.VLRREALIZADO,(S.VLRREALIZADO*-1))))*-1),2) AS VLRREALIZADO       ');
                  qryCompSaldo.SQL.Add('FROM                                                                        ');
                  qryCompSaldo.SQL.Add('    CONTASORCAMEN C,                                                        ');
                  qryCompSaldo.SQL.Add('    GRUPOORCAMEN G,                                                         ');
                  qryCompSaldo.SQL.Add('    SALDOORCADO S                                                           ');
                  qryCompSaldo.SQL.Add('WHERE                                                                       ');
                  qryCompSaldo.SQL.Add('   (G.IDGRUPOORCAMEN IN ('+sGrupos+')) AND              ');
                  qryCompSaldo.SQL.Add('   ((C.FLGATIVA = ''A'') OR (C.FLGATIVA IS NULL)) AND   ');
                  qryCompSaldo.SQL.Add('   (S.EXERCICIO =:EXERCICIO) AND                                            ');
                  qryCompSaldo.SQL.Add('   (S.PERIODO BETWEEN :PERIODOINI AND :PERIODOFIM) AND                      ');
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
                  qryCompSaldo.SQL.Add('UNION ALL                                                                   ');
                  qryCompSaldo.SQL.Add('SELECT                        ');
                  qryCompSaldo.SQL.Add('   S.PERIODO, S.EXERCICIO, G.FLGSINALGRUPO,                                 ');
                  qryCompSaldo.SQL.Add('   ROUND(SUM(DECODE(S.VLRORCCENARIO,NULL,0,DECODE(C.FLGSINALCONTA,''P'',S.VLRORCCENARIO,(S.VLRORCCENARIO*-1)))),2) AS VLRORCADOS,                      ');
                  qryCompSaldo.SQL.Add('   (0) AS VLRREALIZADOS,                                                    ');
                  qryCompSaldo.SQL.Add('   ROUND(DECODE(G.FLGSINALGRUPO,''P'',SUM(DECODE(S.VLRORCCENARIO,NULL,0,DECODE(C.FLGSINALCONTA,''P'',S.VLRORCCENARIO,(S.VLRORCCENARIO*-1)))),          ');
                  qryCompSaldo.SQL.Add('          SUM(DECODE(S.VLRORCCENARIO,NULL,0,DECODE(C.FLGSINALCONTA,''P'',S.VLRORCCENARIO,(S.VLRORCCENARIO*-1))))*-1),2) AS VLRORCADO,                  ');
                  qryCompSaldo.SQL.Add('   (0) AS VLRREALIZADO                                                      ');
                  qryCompSaldo.SQL.Add('FROM                                                                        ');
                  qryCompSaldo.SQL.Add('    GRUPOORCAMEN G,                                                         ');
                  qryCompSaldo.SQL.Add('    CONTASORCAMEN C,                                                        ');
                  qryCompSaldo.SQL.Add('    VALORESCENARIO S                                                        ');
                  qryCompSaldo.SQL.Add('WHERE                                                                       ');
                  qryCompSaldo.SQL.Add('   (G.IDGRUPOORCAMEN IN ('+sGrupos+')) AND              ');
                  qryCompSaldo.SQL.Add('   ((C.FLGATIVA = ''A'') OR (C.FLGATIVA IS NULL)) AND   ');
                  qryCompSaldo.SQL.Add('   (S.EXERCICIO =:EXERCICIO) AND                                            ');
                  qryCompSaldo.SQL.Add('   (S.PERIODO BETWEEN :PERIODOINI AND :PERIODOFIM) AND                      ');
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
                  qryCompSaldo.SQL.Add('   S.PERIODO, S.EXERCICIO, G.FLGSINALGRUPO  ) U                             ');
                  qryCompSaldo.SQL.Add('GROUP BY                                                                    ');
                  qryCompSaldo.SQL.Add('   U.PERIODO, U.EXERCICIO, U.FLGSINALGRUPO                                  ');
                  qryCompSaldo.SQL.Add('ORDER  BY                                                                   ');
                  qryCompSaldo.SQL.Add('   U.EXERCICIO, U.PERIODO                                                   ');
               end;
               qryCompSaldo.ParamByName('IDPESSOA').asInteger       := Sistema.idEmpresa;
               qryCompSaldo.ParamByName('EXERCICIO').asInteger      := StrToInt(dblkExercicio.text);
               qryCompSaldo.ParamByName('PERIODOINI').asInteger     := StrToInt(dblkPeriodoIni.lookupvalue);
               qryCompSaldo.ParamByName('PERIODOFIM').asInteger     := StrToInt(dblkPeriodoIni.lookupvalue)+5;
               qryCompSaldo.Open;
               qryCompSaldo.First;
               Edit;
               While not qryCompSaldo.EOF do begin
                  x:=StrToInt(dblkPeriodoIni.lookupvalue)-1;
                  qryPeriodos.First;
                  While not qryPeriodos.EOF do begin
                     x:=x+1;
                     if qryCompSaldo.FieldByName('PERIODO').AsInteger = x then begin
                        if (x-StrToInt(dblkPeriodoIni.lookupvalue)+1) = 1 then begin
                           FieldByName('ORC01').AsFloat := FieldByName('ORC01').AsFloat + qryCompSaldo.FieldByName('VLRORCADO').AsFloat/rValCot1;
                           FieldByName('REA01').AsFloat := FieldByName('REA01').AsFloat + qryCompSaldo.FieldByName('VLRREALIZADO').AsFloat/rValCot1;
                           Break;
                        end else begin
                           if (x-StrToInt(dblkPeriodoIni.lookupvalue)+1) = 2 then begin
                              FieldByName('ORC02').AsFloat := FieldByName('ORC02').AsFloat + qryCompSaldo.FieldByName('VLRORCADO').AsFloat/rValCot2;
                              FieldByName('REA02').AsFloat := FieldByName('REA02').AsFloat + qryCompSaldo.FieldByName('VLRREALIZADO').AsFloat/rValCot2;
                              Break;
                           end else begin
                              if (x-StrToInt(dblkPeriodoIni.lookupvalue)+1) = 3 then begin
                                 FieldByName('ORC03').AsFloat := FieldByName('ORC03').AsFloat + qryCompSaldo.FieldByName('VLRORCADO').AsFloat/rValCot3;
                                 FieldByName('REA03').AsFloat := FieldByName('REA03').AsFloat + qryCompSaldo.FieldByName('VLRREALIZADO').AsFloat/rValCot3;
                                 Break;
                              end else begin
                                 if (x-StrToInt(dblkPeriodoIni.lookupvalue)+1) = 4 then begin
                                    FieldByName('ORC04').AsFloat := FieldByName('ORC04').AsFloat + qryCompSaldo.FieldByName('VLRORCADO').AsFloat/rValCot4;
                                    FieldByName('REA04').AsFloat := FieldByName('REA04').AsFloat + qryCompSaldo.FieldByName('VLRREALIZADO').AsFloat/rValCot4;
                                    Break;
                                 end else begin
                                    if (x-StrToInt(dblkPeriodoIni.lookupvalue)+1) = 5 then begin
                                       FieldByName('ORC05').AsFloat := FieldByName('ORC05').AsFloat + qryCompSaldo.FieldByName('VLRORCADO').AsFloat/rValCot5;
                                       FieldByName('REA05').AsFloat := FieldByName('REA05').AsFloat + qryCompSaldo.FieldByName('VLRREALIZADO').AsFloat/rValCot5;
                                       Break;
                                    end else begin
                                       if (x-StrToInt(dblkPeriodoIni.lookupvalue)+1) = 6 then begin
                                          FieldByName('ORC06').AsFloat := FieldByName('ORC06').AsFloat + qryCompSaldo.FieldByName('VLRORCADO').AsFloat/rValCot6;
                                          FieldByName('REA06').AsFloat := FieldByName('REA06').AsFloat + qryCompSaldo.FieldByName('VLRREALIZADO').AsFloat/rValCot6;
                                          Break;
                                       end;
                                    end;
                                 end;
                              end;
                           end;
                        end;
                     end;
                     qryPeriodos.Next;
                  end;
                  qryCompSaldo.Next;
               end;
               FieldByName('TOTORC').AsFloat := FieldByName('ORC01').AsFloat + FieldByName('ORC02').AsFloat  + FieldByName('ORC03').AsFloat + FieldByName('ORC04').AsFloat + FieldByName('ORC05').AsFloat + FieldByName('ORC06').AsFloat;
               FieldByName('TOTREA').AsFloat := FieldByName('REA01').AsFloat + FieldByName('REA02').AsFloat  + FieldByName('REA03').AsFloat + FieldByName('REA04').AsFloat + FieldByName('REA05').AsFloat + FieldByName('REA06').AsFloat;
               If FieldByName('TOTORC').AsFloat <> 0 then
                  FieldByName('PERORC').AsFloat := ((FieldByName('TOTORC').AsFloat - FieldByName('TOTREA').AsFloat) / FieldByName('TOTORC').AsFloat)*100;
               If FieldByName('TOTREA').AsFloat <> 0 then
                  FieldByName('PERREA').AsFloat := ((FieldByName('TOTREA').AsFloat - FieldByName('TOTORC').AsFloat) / FieldByName('TOTREA').AsFloat)*100;
               if not cbZerados.Checked then begin
                  If (FieldByName('ORC01').AsFloat = 0) and (FieldByName('REA01').AsFloat = 0) and
                     (FieldByName('ORC02').AsFloat = 0) and (FieldByName('REA02').AsFloat = 0) and
                     (FieldByName('ORC03').AsFloat = 0) and (FieldByName('REA03').AsFloat = 0) and
                     (FieldByName('ORC04').AsFloat = 0) and (FieldByName('REA04').AsFloat = 0) and
                     (FieldByName('ORC05').AsFloat = 0) and (FieldByName('REA05').AsFloat = 0) and
                     (FieldByName('ORC06').AsFloat = 0) and (FieldByName('REA06').AsFloat = 0) then begin 
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
end;



procedure TFrmRParamRelGrupo.FormShow(Sender: TObject);
begin
   inherited;

   //Preenche as combo-boxes
   with qryExercicio do begin
      Prepare;
      ParamByName('IDPESSOA').asInteger := Sistema.idEmpresa;
      Open;
   end;
   with qryPeriodoIni do begin
      Prepare;
      ParamByName('IDPESSOA').asInteger  := Sistema.idEmpresa;
      ParamByName('EXERCICIO').asInteger := Year(Date);
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



procedure TFrmRParamRelGrupo.dblkExercicioClick(Sender: TObject);
begin
   //Preenche a combo-box de período
   if dblkExercicio.text <> '' then begin
      with qryPeriodoIni do begin
         Close;
         Prepare;
         ParamByName('IDPESSOA').asInteger  := Sistema.idEmpresa;
         ParamByName('EXERCICIO').asInteger := StrToInt(dblkExercicio.text);
         Open;
      end;
   end;
end;



procedure TFrmRParamRelGrupo.FormActivate(Sender: TObject);
begin
  inherited;
  qryCenario.Close;
  qryCenario.Open;
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
 
