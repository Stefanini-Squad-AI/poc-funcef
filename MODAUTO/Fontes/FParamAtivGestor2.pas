unit FParamAtivGestor2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,
  TREdit, Mask, wwdbedit, Wwdbspin, Spin, MontaSelect, IvDictio, IvMulti,
  IvEMulti, wwdblook, Db, DBTables, Wwquery;

type
  TfrmParamAtivGestor2 = class(TfrmOkCancelar)
    rdgOrdenacao: TRadioGroup;
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
    qryPeriodoFim: TwwQuery;
    qryPeriodoFimPERIODO: TFloatField;
    qryPeriodoFimNOMEPERIODO: TStringField;
    dblkExercicio: TwwDBLookupCombo;
    Label3: TLabel;
    dblkPeriodoIni: TwwDBLookupCombo;
    Label1: TLabel;
    dblkPeriodoFim: TwwDBLookupCombo;
    Label6: TLabel;
    lblValoresPor: TLabel;
    reDividirPor: TRealEdit;
    cbMovimento: TCheckBox;
    rgUsuXCCCR: TRadioGroup;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dblkExercicioClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamAtivGestor2: TfrmParamAtivGestor2;

implementation

uses UMensErro, uDatabase, DBaseDados, uAutorizacao, uSistema,
     uModulo, uOrcamento, dRelatoriosModAuto, uData, uFuncaoGeral;

{$R *.DFM}


{ -----------------------------------------------------------------------------}
{                                                                              }
{ Gráfico - Distribuição de Saldos por Grupo de Contas                         }
{                                                                              }
{ Autor : Antônio Jorge M.Rodrigues                                            }
{ Data de Início  : 21/03/00                                                   }
{ Data de Término : 21/03/00                                                   }
{ Última Revisão  : 21/03/00 (Antônio Jorge)                                   }
{                                                                              }
{ -----------------------------------------------------------------------------}



procedure TfrmParamAtivGestor2.bbtnConfirmarClick(Sender: TObject);
var rValorDiv : Double;
    sValorDiv : String;
begin
   inherited;

   if reDividirPor.Value = 0 then
      rValorDiv := 1
   else
      rValorDiv := reDividirPor.Value;
   //
   sValorDiv := FuncaoGeral.OraNumero(rValorDiv);

   //Filtra os dados da tela para passar a ordenação correta para o relatório
   if (dblkPeriodoIni.text = '') or (dblkPeriodoFim.text = '') then begin
      MsgDlg('Os Períodos devem ser preenchidos.','Erro',mtError,[mbOk],0);
      ModalResult := mrNone;
   end else begin
      if StrToInt(dblkPeriodoIni.lookupvalue) > StrToInt(dblkPeriodoFim.lookupvalue) then begin
         MsgDlg('O Período Inicial deve ser menor ou igual ao Período Final.','Erro',mtError,[mbOk],0);
         ModalResult := mrNone;
      end else begin
         if OrcamentoBack.DiasNoPeriodo(StrToInt(dblkExercicio.text), StrToInt(dblkPeriodoIni.lookupvalue)) = 0 then begin
            MsgDlg('O Período Inicial não existe para o Exercício selecionado.','Erro',mtError,[mbOk],0);
            ModalResult := mrNone;
         end else begin
            if OrcamentoBack.DiasNoPeriodo(StrToInt(dblkExercicio.text), StrToInt(dblkPeriodoFim.lookupvalue)) = 0 then begin
               MsgDlg('O Período Final não existe para o Exercício selecionado.','Erro',mtError,[mbOk],0);
               ModalResult := mrNone;
            end else begin

               dtmRelatoriosModAuto.txtPerGestor2.caption := 'Período : ' + dblkPeriodoIni.text + ' a ' + dblkPeriodoFim.text + ' de ' + dblkExercicio.text;
               if reDividirPor.Value <> 0 then
                  dtmRelatoriosModAuto.rptAtivGestor2Label6.caption := 'Valores por '+sValorDiv
               else
                  dtmRelatoriosModAuto.rptAtivGestor2Label6.caption := '';
               with dtmRelatoriosModAuto.qryAtivGestor2 do begin
                  SQL.Clear;
                  SQL.Add('SELECT                                                                          ');
                  SQL.Add('   C.IDCONTAORCAMEN, C.NOMECONTAORCAMEN, G.CODGRUPOORC, G.NOMEGRUPOORCAMEN,     ');
                  SQL.Add('   (DECODE(VA.VLRORCACUM,NULL,0,VA.VLRORCACUM)+                                 ');
                  SQL.Add('    DECODE(VT1.VLRTRANSFORI,NULL,0,VT1.VLRTRANSFORI)-                           ');
                  SQL.Add('    DECODE(VT2.VLRTRANSFDES,NULL,0,VT2.VLRTRANSFDES)-                           ');
                  SQL.Add('    DECODE(VS.VLRSUPL,NULL,0,VS.VLRSUPL)+                                       ');
                  SQL.Add('    DECODE(VR.VLRRET,NULL,0,VR.VLRRET))/'+sValorDiv+' AS VLRINICIAL,                          ');
                  SQL.Add('    VA.VLRREALACUM/'+sValorDiv+' AS VLRREALACUM, VT1.VLRTRANSFORI/'+sValorDiv+' AS VLRTRANSFORI, VT2.VLRTRANSFDES/'+sValorDiv+' AS VLRTRANSFDES,                         ');
                  SQL.Add('    VS.VLRSUPL/'+sValorDiv+' AS VLRSUPL, VR.VLRRET/'+sValorDiv+' AS VLRRET, VRE.VLRRES/'+sValorDiv+' AS VLRRES,VA.VLRORCACUM/'+sValorDiv+' AS VLRORCACUM,VCE.VLRCOMP/'+sValorDiv+' AS VLRCOMP,  ');
                  SQL.Add('   (DECODE(VA.VLRORCACUM,NULL,0,VA.VLRORCACUM)-                                 ');
                  SQL.Add('    DECODE(VRE.VLRRES,NULL,0,VRE.VLRRES)-                                       ');
                  SQL.Add('    DECODE(VCE.VLRCOMP,NULL,0,VCE.VLRCOMP))/'+sValorDiv+' AS SALDO,             ');
                  SQL.Add('    DECODE((NVL(VA.VLRORCACUM,0)-NVL(VRE.VLRRES,0)),0,0,                        ');
                  SQL.Add('    NVL(VCE.VLRCOMP,0)/(NVL(VA.VLRORCACUM,0)-NVL(VRE.VLRRES,0))*100) AS PERCENT ');
                  SQL.Add('                                                                                ');
                  SQL.Add('FROM                                                                            ');
                  SQL.Add('   (SELECT                                                                      ');
                  SQL.Add('       SUM(DECODE(VLRORCADO,NULL,0,VLRORCADO)) AS VLRORCACUM,                   ');
                  SQL.Add('       SUM(DECODE(VLRREALIZADO,NULL,0,VLRREALIZADO)) AS VLRREALACUM, IDCONTAORCAMEN ');
                  SQL.Add('    FROM                                                                        ');
                  SQL.Add('       SALDOORCADO                                                              ');
                  SQL.Add('    WHERE                                                                       ');
                  SQL.Add('       (EXERCICIO =:EXERCICIO) AND                                              ');
                  SQL.Add('       (PERIODO BETWEEN :PERIODOINI AND :PERIODOFIM) AND                        ');
                  SQL.Add('       (IDPLANOORCAMEN = :IDPLANOORCAMEN) AND                                   ');
                  SQL.Add('       (IDPESSOA = :IDPESSOA)                                                   ');
                  SQL.Add('    GROUP BY                                                                    ');
                  SQL.Add('       IDCONTAORCAMEN) VA,                                                      ');
                  SQL.Add('                                                                                ');
                  SQL.Add('   (SELECT                                                                      ');
                  SQL.Add('       SUM(DECODE(VLRDEVOLVIDO,NULL,                                            ');
                  SQL.Add('           DECODE(VLRCOMPROMISSO,NULL,VLRRESERVA,(VLRRESERVA-VLRCOMPROMISSO)),  ');
                  SQL.Add('           DECODE(VLRCOMPROMISSO,NULL,(VLRRESERVA-VLRDEVOLVIDO),                ');
                  SQL.Add('           (VLRRESERVA-VLRCOMPROMISSO-VLRDEVOLVIDO)))) AS VLRRES, IDCONTAORCAMEN');
                  SQL.Add('    FROM                                                                        ');
                  SQL.Add('       RESERVAORCAMEN                                                           ');
                  SQL.Add('    WHERE                                                                       ');
                  SQL.Add('       (EXERCICIO =:EXERCICIO) AND                                              ');
                  SQL.Add('       (PERIODO BETWEEN :PERIODOINI AND :PERIODOFIM) AND                        ');
                  SQL.Add('       (IDPLANOORCAMEN = :IDPLANOORCAMEN) AND                                   ');
                  SQL.Add('       (IDPESSOA = :IDPESSOA) AND                                               ');
                  SQL.Add('	  (FLGRESERVA = ''A'')                                                     ');
                  SQL.Add('    GROUP BY                                                                    ');
                  SQL.Add('       IDCONTAORCAMEN) VRE,                                                     ');
                  SQL.Add('                                                                                ');
                  SQL.Add('   (SELECT                                                                      ');
                  SQL.Add('       SUM(DECODE(VLRCOMPROMISSO,NULL,0,VLRCOMPROMISSO)) AS VLRCOMP, IDCONTAORCAMEN                                ');
                  SQL.Add('    FROM                                                                        ');
                  SQL.Add('       RESERVAORCAMEN                                                           ');
                  SQL.Add('    WHERE                                                                       ');
                  SQL.Add('       (EXERCICIO =:EXERCICIO) AND                                              ');
                  SQL.Add('       (PERIODO BETWEEN :PERIODOINI AND :PERIODOFIM) AND                        ');
                  SQL.Add('       (IDPLANOORCAMEN = :IDPLANOORCAMEN) AND                                   ');
                  SQL.Add('	  (FLGRESERVA <> ''C'') AND                                                ');
                  SQL.Add('       (IDPESSOA = :IDPESSOA)                                                   ');
                  SQL.Add('    GROUP BY                                                                    ');
                  SQL.Add('       IDCONTAORCAMEN) VCE,                                                     ');
                  SQL.Add('                                                                                ');
                  SQL.Add('   (SELECT                                                                      ');
                  SQL.Add('       SUM(VLRSOLICITADO) AS VLRTRANSFORI, IDCONTAORIGEM                        ');
                  SQL.Add('    FROM                                                                        ');
                  SQL.Add('       ALTERORCAMENTO                                                           ');
                  SQL.Add('    WHERE                                                                       ');
                  SQL.Add('       (EXERCICIOORIGEM =:EXERCICIO) AND                                        ');
                  SQL.Add('       (PERIODOORIGEM BETWEEN :PERIODOINI AND :PERIODOFIM) AND                  ');
                  SQL.Add('       (IDPLANOORCAMEN = :IDPLANOORCAMEN) AND                                   ');
                  SQL.Add('       (IDPESSOA = :IDPESSOA) AND                                               ');
                  SQL.Add('	  (FLGTIPOALTER = ''T'')                                                   ');
                  SQL.Add('    GROUP BY                                                                    ');
                  SQL.Add('       IDCONTAORIGEM) VT1,                                                      ');
                  SQL.Add('                                                                                ');
                  SQL.Add('   (SELECT                                                                      ');
                  SQL.Add('       SUM(VLRSOLICITADO) AS VLRTRANSFDES, IDCONTADESTINO                       ');
                  SQL.Add('    FROM                                                                        ');
                  SQL.Add('       ALTERORCAMENTO                                                           ');
                  SQL.Add('    WHERE                                                                       ');
                  SQL.Add('       (EXERCICIODESTINO =:EXERCICIO) AND                                       ');
                  SQL.Add('       (PERIODODESTINO BETWEEN :PERIODOINI AND :PERIODOFIM) AND                 ');
                  SQL.Add('       (IDPLANOORCAMEN = :IDPLANOORCAMEN) AND                                   ');
                  SQL.Add('       (IDPESSOA = :IDPESSOA) AND                                               ');
                  SQL.Add('	  (FLGTIPOALTER = ''T'')                                                   ');
                  SQL.Add('    GROUP BY                                                                    ');
                  SQL.Add('       IDCONTADESTINO) VT2,                                                     ');
                  SQL.Add('   (SELECT                                                                      ');
                  SQL.Add('       SUM(VLRSOLICITADO) AS VLRRET, IDCONTAORIGEM                              ');
                  SQL.Add('    FROM                                                                        ');
                  SQL.Add('       ALTERORCAMENTO                                                           ');
                  SQL.Add('    WHERE                                                                       ');
                  SQL.Add('       (EXERCICIOORIGEM =:EXERCICIO) AND                                        ');
                  SQL.Add('       (PERIODOORIGEM BETWEEN :PERIODOINI AND :PERIODOFIM) AND                  ');
                  SQL.Add('       (IDPLANOORCAMEN = :IDPLANOORCAMEN) AND                                   ');
                  SQL.Add('       (IDPESSOA = :IDPESSOA) AND                                               ');
                  SQL.Add('	  (FLGTIPOALTER = ''R'')                                                   ');
                  SQL.Add('    GROUP BY                                                                    ');
                  SQL.Add('       IDCONTAORIGEM) VR,                                                       ');
                  SQL.Add('   (SELECT                                                                      ');
                  SQL.Add('       SUM(VLRSOLICITADO) AS VLRSUPL, IDCONTAORIGEM                             ');
                  SQL.Add('    FROM                                                                        ');
                  SQL.Add('       ALTERORCAMENTO                                                           ');
                  SQL.Add('    WHERE                                                                       ');
                  SQL.Add('       (EXERCICIOORIGEM =:EXERCICIO) AND                                        ');
                  SQL.Add('       (PERIODOORIGEM BETWEEN :PERIODOINI AND :PERIODOFIM) AND                  ');
                  SQL.Add('       (IDPESSOA = :IDPESSOA) AND                                               ');
                  SQL.Add('       (IDPLANOORCAMEN = :IDPLANOORCAMEN) AND                                   ');
                  SQL.Add('	  (FLGTIPOALTER = ''S'')                                                   ');
                  SQL.Add('    GROUP BY                                                                    ');
                  SQL.Add('       IDCONTAORIGEM) VS,                                                       ');
                  SQL.Add('                                                                                ');
                  SQL.Add('    CONTASORCAMEN C,                                                            ');
                  SQL.Add('    GRUPOORCAMEN G                                                              ');
                  SQL.Add('WHERE                                                                           ');
                  if rgUsuXCCCR.ItemIndex = 0 then begin
                     SQL.Add(' EXISTS (SELECT UXC.IDPESSOAACESSO                                           ');
                     SQL.Add('         FROM PESSOAXCRESP UXC                                               ');
                     SQL.Add('         WHERE (UXC.IDPESSOAACESSO = '+IntToStr(Sistema.idUsuario)+')        ');
                     SQL.Add('           AND (UXC.CODCENTRORESPON = C.CODCENTRORESPON)                     ');
                     SQL.Add('           AND (UXC.IDPESSOA = C.IDPESSOA)  ) AND                            ');
                  end else begin
                     SQL.Add(' EXISTS (SELECT UXC.IDUSUARIO                                                ');
                     SQL.Add('         FROM USCCUSTO UXC, COMPCONTASORCAMEN CP                             ');
                     SQL.Add('         WHERE (UXC.IDUSUARIO = '+IntToStr(Sistema.idUsuario)+')             ');
                     SQL.Add('           AND (UXC.IDPESSOA = '+IntToStr(Sistema.idEmpresa)+')              ');
                     SQL.Add('           AND (CP.IDCONTAORCAMEN = C.IDCONTAORCAMEN)                        ');
                     SQL.Add('           AND (CP.IDPLANOORCAMEN = C.IDPLANOORCAMEN)                        ');
                     SQL.Add('           AND (UXC.CODCENTROCUSTO = CP.CODCENTROCUSTO)                      ');
                     SQL.Add('           AND (UXC.IDEMPRESA = CP.IDEMPRESA) GROUP BY UXC.IDUSUARIO ) AND   ');
                  end;
                  if dblcCentRespConta.text <> '' then begin
                     SQL.Add('(RTRIM(C.CODCENTRORESPON) =:CODCENTRORESPON) AND                             ');
                  end;
                  SQL.Add('  (C.IDPLANOORCAMEN = :IDPLANOORCAMEN) AND                                      ');
                  SQL.Add('  ((C.FLGATIVA = ''A'') OR (C.FLGATIVA IS NULL)) AND                           ');
                  SQL.Add('  (C.IDGRUPOORCAMEN = G.IDGRUPOORCAMEN) AND                                     ');
                  SQL.Add('  (C.IDCONTAORCAMEN = VA.IDCONTAORCAMEN) AND                                    ');
                  SQL.Add('  (C.IDCONTAORCAMEN = VT1.IDCONTAORIGEM(+)) AND                                 ');
                  SQL.Add('  (C.IDCONTAORCAMEN = VT2.IDCONTADESTINO(+)) AND                                ');
                  SQL.Add('  (C.IDCONTAORCAMEN = VRE.IDCONTAORCAMEN(+)) AND                                ');
                  SQL.Add('  (C.IDCONTAORCAMEN = VCE.IDCONTAORCAMEN(+)) AND                                ');
                  SQL.Add('  (C.IDCONTAORCAMEN = VR.IDCONTAORIGEM(+)) AND                                  ');
                  if cbMovimento.Checked then begin
                     SQL.Add('   (((DECODE(VA.VLRORCACUM,NULL,0,VA.VLRORCACUM)+                                       ');
                     SQL.Add('    DECODE(VT1.VLRTRANSFORI,NULL,0,VT1.VLRTRANSFORI)-                                   ');
                     SQL.Add('    DECODE(VT2.VLRTRANSFDES,NULL,0,VT2.VLRTRANSFDES)-                                   ');
                     SQL.Add('    DECODE(VS.VLRSUPL,NULL,0,VS.VLRSUPL)+                                               ');
                     SQL.Add('    DECODE(VR.VLRRET,NULL,0,VR.VLRRET)) <> 0) OR                                        ');
                     SQL.Add('    (VT1.VLRTRANSFORI <> 0) OR (VT2.VLRTRANSFDES <> 0) OR                               ');
                     SQL.Add('    (VS.VLRSUPL <> 0) OR (VR.VLRRET <> 0) OR (VRE.VLRRES <> 0) OR (VCE.VLRCOMP <> 0) OR ');
                     SQL.Add('   ((DECODE(VA.VLRORCACUM,NULL,0,VA.VLRORCACUM)-                                        ');
                     SQL.Add('    DECODE(VRE.VLRRES,NULL,0,VRE.VLRRES)-                                               ');
                     SQL.Add('    DECODE(VCE.VLRCOMP,NULL,0,VCE.VLRCOMP)) <> 0)) AND                                  ');
                  end;
                  SQL.Add('  (C.IDCONTAORCAMEN = VS.IDCONTAORIGEM(+))                                      ');
                  SQL.Add('ORDER BY                                                                        ');
                  if rdgOrdenacao.itemindex = 0 then begin
                     SQL.Add('G.CODGRUPOORC,                                                               ');
                  end else begin
                     SQL.Add('G.NOMEGRUPOORCAMEN,                                                          ');
                  end;
                  SQL.Add('C.IDCONTAORCAMEN                                                                ');
                  //
                  ParamByName('IDPESSOA').asInteger       := Sistema.idEmpresa;
                  ParamByName('IDPLANOORCAMEN').asInteger := Modulo.iPlanoOrc;
                  ParamByName('EXERCICIO').asInteger      := StrToInt(dblkExercicio.text);
                  ParamByName('PERIODOINI').asInteger     := StrToInt(dblkPeriodoIni.lookupValue);
                  ParamByName('PERIODOFIM').asInteger     := StrToInt(dblkPeriodoFim.lookupValue);
                  if dblcCentRespConta.text <> '' then begin
                     ParamByName('CODCENTRORESPON').asString := dblcCentRespConta.LookupValue;
                  end;
                  //SQL.SaveToFile('C:\teste.sql');
                  Open;
               end;
            end;
         end;
      end;
   end;
end;



procedure TfrmParamAtivGestor2.FormShow(Sender: TObject);
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
   with qryPeriodoFim do begin
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
end;



procedure TfrmParamAtivGestor2.dblkExercicioClick(Sender: TObject);
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
      with qryPeriodoFim do begin
         Close;
         Prepare;
         ParamByName('IDPESSOA').asInteger  := Sistema.idEmpresa;
         ParamByName('EXERCICIO').asInteger := StrToInt(dblkExercicio.text);
         Open;
      end;
   end;
end;

{SELECT
   C.IDCONTAORCAMEN, C.NOMECONTAORCAMEN, G.CODGRUPOORC, G.NOMEGRUPOORCAMEN,
   (DECODE(VA.VLRORCACUM,NULL,0,VA.VLRORCACUM)+
    DECODE(VT1.VLRTRANSFORI,NULL,0,VT1.VLRTRANSFORI)-
    DECODE(VT2.VLRTRANSFDES,NULL,0,VT2.VLRTRANSFDES)-
    DECODE(VS.VLRSUPL,NULL,0,VS.VLRSUPL)+
    DECODE(VR.VLRRET,NULL,0,VR.VLRRET)) AS VLRINICIAL,
    VA.VLRREALACUM, VT1.VLRTRANSFORI, VT2.VLRTRANSFDES,
    VS.VLRSUPL, VR.VLRRET, VRE.VLRRES,VA.VLRORCACUM,VCE.VLRCOMP,
   (DECODE(VA.VLRORCACUM,NULL,0,VA.VLRORCACUM)-
    DECODE(VRE.VLRRES,NULL,0,VRE.VLRRES)-
    DECODE(VCE.VLRCOMP,NULL,0,VCE.VLRCOMP)) AS SALDO,
   (DECODE((DECODE(VA.VLRORCACUM,NULL,0,VA.VLRORCACUM)+
    DECODE(VT1.VLRTRANSFORI,NULL,0,VT1.VLRTRANSFORI)-
    DECODE(VT2.VLRTRANSFDES,NULL,0,VT2.VLRTRANSFDES)-
    DECODE(VS.VLRSUPL,NULL,0,VS.VLRSUPL)+
    DECODE(VR.VLRRET,NULL,0,VR.VLRRET)),0,0,(VA.VLRREALACUM/(DECODE(VA.VLRORCACUM,NULL,0,VA.VLRORCACUM)+
    DECODE(VT1.VLRTRANSFORI,NULL,0,VT1.VLRTRANSFORI)-
    DECODE(VT2.VLRTRANSFDES,NULL,0,VT2.VLRTRANSFDES)-
    DECODE(VS.VLRSUPL,NULL,0,VS.VLRSUPL)+
    DECODE(VR.VLRRET,NULL,0,VR.VLRRET))*100))) AS PERCENT

FROM
   (SELECT
       SUM(DECODE(VLRORCADO,NULL,0,VLRORCADO)) AS VLRORCACUM,
       SUM(DECODE(VLRREALIZADO,NULL,0,VLRREALIZADO)) AS VLRREALACUM, IDCONTAORCAMEN
    FROM
       SALDOORCADO
    WHERE
       (EXERCICIO =2000) AND
       (PERIODO BETWEEN 1 AND 1) AND
       (IDPLANOORCAMEN = 1) AND
       (IDPESSOA = 1)
    GROUP BY
       IDCONTAORCAMEN) VA,

   (SELECT
       SUM(DECODE(VLRDEVOLVIDO,NULL,
           DECODE(VLRCOMPROMISSO,NULL,VLRRESERVA,(VLRRESERVA-VLRCOMPROMISSO)),
           DECODE(VLRCOMPROMISSO,NULL,(VLRRESERVA-VLRDEVOLVIDO),
           (VLRRESERVA-VLRCOMPROMISSO-VLRDEVOLVIDO)))) AS VLRRES, IDCONTAORCAMEN
    FROM
       RESERVAORCAMEN
    WHERE
       (EXERCICIO =2000) AND
       (PERIODO BETWEEN 1 AND 1) AND
       (IDPLANOORCAMEN = 1) AND
       (IDPESSOA = 1) AND 
	    (FLGRESERVA = 'A')
    GROUP BY
       IDCONTAORCAMEN) VRE,

   (SELECT
       SUM(DECODE(VLRCOMPROMISSO,NULL,0,VLRCOMPROMISSO)) AS VLRCOMP, IDCONTAORCAMEN
    FROM
       RESERVAORCAMEN
    WHERE
       (EXERCICIO =2000) AND
       (PERIODO BETWEEN 1 AND 1) AND
       (IDPLANOORCAMEN = 1) AND
       (IDPESSOA = 1)
    GROUP BY
       IDCONTAORCAMEN) VCE,

   (SELECT
       SUM(VLRSOLICITADO) AS VLRTRANSFORI, IDCONTAORIGEM
    FROM
       ALTERORCAMENTO
    WHERE
       (EXERCICIOORIGEM =2000) AND
       (PERIODOORIGEM BETWEEN 1 AND 1) AND
       (IDPLANOORCAMEN = 1) AND
       (IDPESSOA = 1) AND
	  (FLGTIPOALTER = 'T')
    GROUP BY
       IDCONTAORIGEM) VT1,

   (SELECT
       SUM(VLRSOLICITADO) AS VLRTRANSFDES, IDCONTADESTINO
    FROM
       ALTERORCAMENTO
    WHERE
       (EXERCICIODESTINO =2000) AND
       (PERIODODESTINO BETWEEN 1 AND 1) AND
       (IDPLANOORCAMEN = 1) AND
       (IDPESSOA = 1) AND
	  (FLGTIPOALTER = 'T')
    GROUP BY
       IDCONTADESTINO) VT2,
   (SELECT
       SUM(VLRSOLICITADO) AS VLRRET, IDCONTAORIGEM
    FROM
       ALTERORCAMENTO
    WHERE
       (EXERCICIOORIGEM =2000) AND
       (PERIODOORIGEM BETWEEN 1 AND 1) AND
       (IDPLANOORCAMEN = 1) AND
       (IDPESSOA = 1) AND
	  (FLGTIPOALTER = 'R')
    GROUP BY
       IDCONTAORIGEM) VR,
   (SELECT
       SUM(VLRSOLICITADO) AS VLRSUPL, IDCONTAORIGEM
    FROM
       ALTERORCAMENTO
    WHERE
       (EXERCICIOORIGEM =2000) AND
       (PERIODOORIGEM BETWEEN 1 AND 1) AND
       (IDPLANOORCAMEN = 1) AND
       (IDPESSOA = 1) AND
	    (FLGTIPOALTER = 'S')
    GROUP BY
       IDCONTAORIGEM) VS,

    CONTASORCAMEN C,
    GRUPOORCAMEN G
WHERE
  (C.IDPLANOORCAMEN = 1) AND
  (C.IDGRUPOORCAMEN = G.IDGRUPOORCAMEN) AND
  (C.IDCONTAORCAMEN = VA.IDCONTAORCAMEN) AND
  (C.IDCONTAORCAMEN = VT1.IDCONTAORIGEM(+)) AND
  (C.IDCONTAORCAMEN = VT2.IDCONTADESTINO(+)) AND
  (C.IDCONTAORCAMEN = VRE.IDCONTAORCAMEN(+)) AND
  (C.IDCONTAORCAMEN = VCE.IDCONTAORCAMEN(+)) AND
  (C.IDCONTAORCAMEN = VR.IDCONTAORIGEM(+)) AND
  (C.IDCONTAORCAMEN = VS.IDCONTAORIGEM(+))
ORDER BY
  G.CODGRUPOORC,
  C.IDCONTAORCAMEN
 }

end.


