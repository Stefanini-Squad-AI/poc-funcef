unit FRParamOrcxRealConta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,
  TREdit, Mask, wwdbedit, Wwdbspin, Spin, MontaSelect, IvDictio, IvMulti,
  IvEMulti, wwdblook, Db, DBTables, Wwquery, CMDBLookupCombo, ComCtrls;

type
  TFrmRParamOrcxRealConta = class(TfrmOkCancelar)
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
    lblValoresPor: TLabel;
    reDividirPor: TRealEdit;
    rgSinal: TRadioGroup;
    qryGrupoOrc: TwwQuery;
    qryGrupoOrcIDGRUPOORCAMEN: TFloatField;
    qryGrupoVerif: TwwQuery;
    qryGrupoVerifCODGRUPOORC: TStringField;
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
  FrmRParamOrcxRealConta: TFrmRParamOrcxRealConta;

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



procedure TFrmRParamOrcxRealConta.bbtnConfirmarClick(Sender: TObject);
var rValorDiv : Double;
    sValorDiv : String;
    sGrupos : String;
begin
   sGrupos := '';
   if (trim(dblcGrupoIni.Text) <> '') or (trim(dblcGrupoFim.Text) <> '') then begin
      qryGrupoVerif.Close;
      qryGrupoVerif.Open;
      qryGrupoOrc.Close;
      if (trim(dblcGrupoIni.Text) <> '') then begin
         qryGrupoOrc.ParamByName('CODGRUPOORCINI').asString := Espaco(dblcGrupoIni.LookupValue,10);
      end else begin
         qryGrupoVerif.First;
         qryGrupoOrc.ParamByName('CODGRUPOORCINI').asString := Espaco(qryGrupoVerifCODGRUPOORC.AsString,10);
      end;
      if (trim(dblcGrupoIni.Text) <> '') then begin
         qryGrupoOrc.ParamByName('CODGRUPOORCFIM').asString := Espaco(dblcGrupoFim.LookupValue,10);
      end else begin
         qryGrupoVerif.Last;
         qryGrupoOrc.ParamByName('CODGRUPOORCFIM').asString := Espaco(qryGrupoVerifCODGRUPOORC.AsString,10);
      end;
      qryGrupoOrc.Open;
      if qryGrupoOrc.IsEmpty then
         sGrupos := '0';
      qryGrupoOrc.First;
      while not qryGrupoOrc.Eof do begin
         if sGrupos = '' then
            sGrupos := qryGrupoOrcIDGRUPOORCAMEN.AsString
         else
            sGrupos := sGrupos + ','+qryGrupoOrcIDGRUPOORCAMEN.AsString;
         qryGrupoOrc.Next;
      end;
   end;
   if reDividirPor.Value = 0 then
      rValorDiv := 1
   else
      rValorDiv := reDividirPor.Value;
   sValorDiv := FuncaoGeral.OraNumero(rValorDiv);
   if reDividirPor.Value <> 0 then
      dtmRelatoriosModAuto.ppLabel244.caption := 'Valores por '+sValorDiv
   else
      dtmRelatoriosModAuto.ppLabel244.caption := '';

   //Filtra os dados da tela para passar a ordenação correta para o relatório
   if (dblkPeriodoIni.text = '') then begin
      MsgDlg('O Período deve ser preenchido.','Erro',mtError,[mbOk],0);
      ModalResult := mrNone;
   end else begin
      if OrcamentoBack.DiasNoPeriodo(StrToInt(dblkExercicio.text), StrToInt(dblkPeriodoIni.lookupvalue)) = 0 then begin
         MsgDlg('O Período não existe para o Exercício selecionado.','Erro',mtError,[mbOk],0);
         ModalResult := mrNone;
      end else begin
         dtmRelatoriosModAuto.ppLabel212.Caption := 'Orçado x Realizado em '+dblkPeriodoIni.Text+'/'+dblkExercicio.Text;
         with dtmRelatoriosModAuto.qryOrcxRealConta do begin
            Close;
            SQL.Clear;
            SQL.Add('SELECT                                                                      ');
            SQL.Add('   G.FLGSINALGRUPO, G.CODGRUPOORC, U.IDCONTAORCAMEN,                        ');
            SQL.Add('   G.NOMEGRUPOORCAMEN, C.NOMECONTAORCAMEN,                                  ');
            if rgSinal.ItemIndex = 0 then begin
               SQL.Add('   SUM(DECODE(C.FLGSINALCONTA,''P'',NVL(U.VLRORCADOACUM,0),NVL(U.VLRORCADOACUM*-1,0)))/'+sValorDiv+' AS VLRORCADOACUM,                               ');
               SQL.Add('   SUM(DECODE(C.FLGSINALCONTA,''P'',NVL(U.VLRREALIZADOACUM,0),NVL(U.VLRREALIZADOACUM*-1,0)))/'+sValorDiv+' AS VLRREALIZADOACUM,                      ');
               SQL.Add('   SUM(DECODE(C.FLGSINALCONTA,''P'',NVL(U.VLRORCADO,0),NVL(U.VLRORCADO*-1,0)))/'+sValorDiv+' AS VLRORCADO,                                           ');
               SQL.Add('   SUM(DECODE(C.FLGSINALCONTA,''P'',NVL(U.VLRREALIZADO,0),NVL(U.VLRREALIZADO*-1,0)))/'+sValorDiv+' AS VLRREALIZADO,                                  ');
               SQL.Add('   (SUM(DECODE(C.FLGSINALCONTA,''P'',NVL(U.VLRORCADOACUM,0),NVL(U.VLRORCADOACUM*-1,0)))-SUM(DECODE(C.FLGSINALCONTA,''P'',NVL(U.VLRREALIZADOACUM,0),NVL(U.VLRREALIZADOACUM*-1,0))))/'+sValorDiv+' AS VARACUM, ');
               SQL.Add('   (SUM(DECODE(C.FLGSINALCONTA,''P'',NVL(U.VLRORCADO,0),NVL(U.VLRORCADO*-1,0)))-SUM(DECODE(C.FLGSINALCONTA,''P'',NVL(U.VLRREALIZADO,0),NVL(U.VLRREALIZADO*-1,0))))/'+sValorDiv+' AS VARPER,                  ');
            end else begin
               SQL.Add('   SUM(NVL(U.VLRORCADOACUM,0))/'+sValorDiv+' AS VLRORCADOACUM,                              ');
               SQL.Add('   SUM(NVL(U.VLRREALIZADOACUM,0))/'+sValorDiv+' AS VLRREALIZADOACUM,                        ');
               SQL.Add('   SUM(NVL(U.VLRORCADO,0))/'+sValorDiv+' AS VLRORCADO,                                      ');
               SQL.Add('   SUM(NVL(U.VLRREALIZADO,0))/'+sValorDiv+' AS VLRREALIZADO,                                ');
               SQL.Add('   (SUM(NVL(U.VLRORCADOACUM,0)) - SUM(NVL(U.VLRREALIZADOACUM,0)))/'+sValorDiv+' AS VARACUM, ');
               SQL.Add('   (SUM(NVL(U.VLRORCADO,0)) - SUM(NVL(U.VLRREALIZADO,0)))/'+sValorDiv+' AS VARPER,          ');
            end;
            SQL.Add('   DECODE(SUM(NVL(U.VLRORCADOACUM,0)),0,0,(SUM(NVL(U.VLRORCADOACUM,0)) - SUM(NVL(U.VLRREALIZADOACUM,0)))/SUM(NVL(U.VLRORCADOACUM,0))*100) AS VARPACUM,    ');
            SQL.Add('   DECODE(SUM(NVL(U.VLRORCADO,0)),0,0,(SUM(NVL(U.VLRORCADO,0)) - SUM(NVL(U.VLRREALIZADO,0)))/SUM(NVL(U.VLRORCADO,0))*100) AS VARPPER                      ');
            SQL.Add('FROM (                                                                      ');
            SQL.Add('SELECT                         ');
            SQL.Add('   S.IDPLANOORCAMEN, S.IDCONTAORCAMEN,                        ');
            SQL.Add('   (0) AS VLRORCADOACUM,                                                    ');
            SQL.Add('   (0) AS VLRREALIZADOACUM,                                                 ');
            SQL.Add('   ROUND(SUM(NVL(S.VLRORCADO,0)),2) AS VLRORCADO,            ');
            SQL.Add('   ROUND(SUM(NVL(S.VLRREALIZADO,0)),2) AS VLRREALIZADO       ');
            SQL.Add('FROM                                                                        ');
            SQL.Add('    SALDOORCADO S                                                           ');
            SQL.Add('WHERE                                                                       ');
            if edConteudo1.Text <> '' then begin
               SQL.Add('(SUBSTR(S.IDCONTAORCAMEN,'+FloatToStr(sePosIni1.Value)+','+FloatToStr(sePosFim1.Value)+') IN ('+trim(edConteudo1.Text)+')) AND ');
            end;
            if edConteudo2.Text <> '' then begin
               SQL.Add('(SUBSTR(S.IDCONTAORCAMEN,'+FloatToStr(sePosIni2.Value)+','+FloatToStr(sePosFim2.Value)+') IN ('+trim(edConteudo2.Text)+')) AND ');
            end;
            if edConteudo3.Text <> '' then begin
               SQL.Add('(SUBSTR(S.IDCONTAORCAMEN,'+FloatToStr(sePosIni3.Value)+','+FloatToStr(sePosFim3.Value)+') IN ('+trim(edConteudo3.Text)+')) AND ');
            end;
            if edConteudo4.Text <> '' then begin
               SQL.Add('(SUBSTR(S.IDCONTAORCAMEN,'+FloatToStr(sePosIni4.Value)+','+FloatToStr(sePosFim4.Value)+') IN ('+trim(edConteudo4.Text)+')) AND ');
            end;
            SQL.Add('   (S.EXERCICIO =:EXERCICIO) AND                                            ');
            SQL.Add('   (S.PERIODO  = :PERIODOINI) AND                                           ');
            SQL.Add('   (S.IDPESSOA = :IDPESSOA)                                                 ');
            SQL.Add('GROUP BY                                                                    ');
            SQL.Add('   S.IDPLANOORCAMEN, S.IDCONTAORCAMEN                                       ');
            SQL.Add('UNION ALL ');
            SQL.Add('SELECT                         ');
            SQL.Add('   S.IDPLANOORCAMEN, S.IDCONTAORCAMEN,                        ');
            SQL.Add('   ROUND(SUM(NVL(S.VLRORCADO,0)),2) AS VLRORCADOACUM,       ');
            SQL.Add('   ROUND(SUM(NVL(S.VLRREALIZADO,0)),2) AS VLRREALIZADOACUM, ');
            SQL.Add('   (0) AS VLRORCADO,                      ');
            SQL.Add('   (0) AS VLRREALIZADO                    ');
            SQL.Add('FROM                                                                        ');
            SQL.Add('    SALDOORCADO S                                                           ');
            SQL.Add('WHERE                                                                       ');
            if edConteudo1.Text <> '' then begin
               SQL.Add('(SUBSTR(S.IDCONTAORCAMEN,'+FloatToStr(sePosIni1.Value)+','+FloatToStr(sePosFim1.Value)+') IN ('+trim(edConteudo1.Text)+')) AND ');
            end;
            if edConteudo2.Text <> '' then begin
               SQL.Add('(SUBSTR(S.IDCONTAORCAMEN,'+FloatToStr(sePosIni2.Value)+','+FloatToStr(sePosFim2.Value)+') IN ('+trim(edConteudo2.Text)+')) AND ');
            end;
            if edConteudo3.Text <> '' then begin
               SQL.Add('(SUBSTR(S.IDCONTAORCAMEN,'+FloatToStr(sePosIni3.Value)+','+FloatToStr(sePosFim3.Value)+') IN ('+trim(edConteudo3.Text)+')) AND ');
            end;
            if edConteudo4.Text <> '' then begin
               SQL.Add('(SUBSTR(S.IDCONTAORCAMEN,'+FloatToStr(sePosIni4.Value)+','+FloatToStr(sePosFim4.Value)+') IN ('+trim(edConteudo4.Text)+')) AND ');
            end;
            SQL.Add('   (S.EXERCICIO =:EXERCICIO) AND                                            ');
            SQL.Add('   (S.PERIODO <= :PERIODOINI) AND                                           ');
            SQL.Add('   (S.IDPESSOA = :IDPESSOA)                                                 ');
            SQL.Add('GROUP BY                                                                    ');
            SQL.Add('   S.IDPLANOORCAMEN, S.IDCONTAORCAMEN                                       ');
            SQL.Add('UNION ALL ');
            SQL.Add('SELECT                                                                      ');
            SQL.Add('   S.IDPLANOORCAMEN, S.IDCONTAORCAMEN,                                      ');
            SQL.Add('   ROUND(SUM(NVL(S.VLRORCADO,0)),2) AS VLRORCADOACUM,       ');
            SQL.Add('   ROUND(SUM(NVL(S.VLRREALIZADO,0)),2) AS VLRREALIZADOACUM, ');
            SQL.Add('   (0) AS VLRORCADO,                      ');
            SQL.Add('   (0) AS VLRREALIZADO                    ');
            SQL.Add('FROM                                                                        ');
            SQL.Add('    SALDOORCADOANT S                                                        ');
            SQL.Add('WHERE                                                                       ');
            if edConteudo1.Text <> '' then begin
               SQL.Add('(SUBSTR(S.IDCONTAORCAMEN,'+FloatToStr(sePosIni1.Value)+','+FloatToStr(sePosFim1.Value)+') IN ('+trim(edConteudo1.Text)+')) AND ');
            end;
            if edConteudo2.Text <> '' then begin
               SQL.Add('(SUBSTR(S.IDCONTAORCAMEN,'+FloatToStr(sePosIni2.Value)+','+FloatToStr(sePosFim2.Value)+') IN ('+trim(edConteudo2.Text)+')) AND ');
            end;
            if edConteudo3.Text <> '' then begin
               SQL.Add('(SUBSTR(S.IDCONTAORCAMEN,'+FloatToStr(sePosIni3.Value)+','+FloatToStr(sePosFim3.Value)+') IN ('+trim(edConteudo3.Text)+')) AND ');
            end;
            if edConteudo4.Text <> '' then begin
               SQL.Add('(SUBSTR(S.IDCONTAORCAMEN,'+FloatToStr(sePosIni4.Value)+','+FloatToStr(sePosFim4.Value)+') IN ('+trim(edConteudo4.Text)+')) AND ');
            end;
            SQL.Add('   (S.EXERCICIO =:EXERCICIO) AND                                            ');
            SQL.Add('   (S.IDPESSOA = :IDPESSOA)                                                 ');
            SQL.Add('GROUP BY                                                                    ');
            SQL.Add('   S.IDPLANOORCAMEN, S.IDCONTAORCAMEN) U,                                   ');
            SQL.Add('   CONTASORCAMEN C,                                                         ');
            SQL.Add('   GRUPOORCAMEN G                                                           ');
            SQL.Add('WHERE                                                                       ');
            if (trim(dblcGrupoIni.Text) <> '') or (trim(dblcGrupoFim.Text) <> '') then begin
               SQL.Add('   (G.IDGRUPOORCAMEN IN ('+sGrupos+')) AND              ');
            end;
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
               SQL.Add('(C.CODCENTRORESPON LIKE '''+dblcCentRespConta.LookupValue+'%'+''') AND  ');
               SQL.Add('(C.IDPESSOA = :IDPESSOA) AND                                             ');
            end;
            SQL.Add('   ((C.FLGATIVA = ''A'') OR (C.FLGATIVA IS NULL)) AND          ');
            SQL.Add('   (C.IDPLANOORCAMEN = U.IDPLANOORCAMEN) AND   ');
            SQL.Add('   (C.IDCONTAORCAMEN = U.IDCONTAORCAMEN) AND   ');
            SQL.Add('   (C.IDGRUPOORCAMEN = G.IDGRUPOORCAMEN)       ');
            SQL.Add('GROUP BY                                                                    ');
            SQL.Add('   G.NOMEGRUPOORCAMEN, C.NOMECONTAORCAMEN, C.FLGSINALCONTA,                 ');
            SQL.Add('   G.FLGSINALGRUPO, G.CODGRUPOORC, U.IDCONTAORCAMEN                         ');
            SQL.Add('HAVING                                                                      ');
            SQL.Add('   (SUM(NVL(U.VLRORCADOACUM,0)) <> 0) OR                                    ');
            SQL.Add('   (SUM(NVL(U.VLRREALIZADOACUM,0)) <> 0) OR                                 ');
            SQL.Add('   (SUM(NVL(U.VLRORCADO,0)) <> 0) OR                                        ');
            SQL.Add('   (SUM(NVL(U.VLRREALIZADO,0)) <> 0)                                        ');
            SQL.Add('ORDER  BY                                                                   ');
            SQL.Add('   G.CODGRUPOORC, U.IDCONTAORCAMEN                                          ');
            ParamByName('EXERCICIO').AsInteger  := StrToInt(dblkExercicio.LookupValue);
            ParamByName('PERIODOINI').AsInteger := StrToInt(dblkPeriodoIni.LookupValue);
            ParamByName('IDPESSOA').AsInteger   := Sistema.IdEmpresa;
            Open;
         end;
      end;
   end;
end;



procedure TFrmRParamOrcxRealConta.FormShow(Sender: TObject);
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
   with qryGrupoIni do begin
      Close;
      Open;
   end;
   with qryGrupoFim do begin
      Close;
      Open;
   end;
   //
end;



procedure TFrmRParamOrcxRealConta.dblkExercicioClick(Sender: TObject);
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

{

//query nova

SELECT
   G.FLGSINALGRUPO, G.CODGRUPOORC, U.IDCONTAORCAMEN,
   G.NOMEGRUPOORCAMEN, C.NOMECONTAORCAMEN,                                  
   SUM(NVL(U.VLRORCADOACUM,0))/1 AS VLRORCADOACUM,                                                                                                          
   SUM(NVL(U.VLRREALIZADOACUM,0))/1 AS VLRREALIZADOACUM,                                                                                                    
   (SUM(NVL(U.VLRORCADOACUM,0)) - SUM(NVL(U.VLRREALIZADOACUM,0)))/1 AS VARACUM,                                                                             
   DECODE(SUM(NVL(U.VLRORCADOACUM,0)),0,0,(SUM(NVL(U.VLRORCADOACUM,0)) - SUM(NVL(U.VLRREALIZADOACUM,0)))/SUM(NVL(U.VLRORCADOACUM,0))*100) AS VARPACUM,    
   SUM(NVL(U.VLRORCADO,0))/1 AS VLRORCADO,
   SUM(NVL(U.VLRREALIZADO,0))/1 AS VLRREALIZADO,                                                                                                            
   (SUM(NVL(U.VLRORCADO,0)) - SUM(NVL(U.VLRREALIZADO,0)))/1 AS VARPER,                                                                                      
   DECODE(SUM(NVL(U.VLRORCADO,0)),0,0,(SUM(NVL(U.VLRORCADO,0)) - SUM(NVL(U.VLRREALIZADO,0)))/SUM(NVL(U.VLRORCADO,0))*100) AS VARPPER                      
FROM 
(                                                                      
SELECT                         
   S.IDCONTAORCAMEN,S.IDPLANOORCAMEN,                                  
   (0) AS VLRORCADOACUM,                                                    
   (0) AS VLRREALIZADOACUM,
   ROUND(SUM(NVL(S.VLRORCADO,0)),2) AS VLRORCADO,            
   ROUND(SUM(NVL(S.VLRREALIZADO,0)),2) AS VLRREALIZADO       
FROM
    SALDOORCADO S                                                           
WHERE                                                                       
   (S.EXERCICIO =2001) AND                                            
   (S.PERIODO  = 12) AND                                           
   (S.IDPESSOA = 14185)                                              
GROUP BY
   S.IDCONTAORCAMEN,S.IDPLANOORCAMEN                                  
UNION ALL 
SELECT                         
   S.IDCONTAORCAMEN,S.IDPLANOORCAMEN,                                  
   ROUND(SUM(NVL(S.VLRORCADO,0)),2) AS VLRORCADOACUM,       
   ROUND(SUM(NVL(S.VLRREALIZADO,0)),2) AS VLRREALIZADOACUM, 
   (0) AS VLRORCADO,                      
   (0) AS VLRREALIZADO                    
FROM
    SALDOORCADO S                                                           
WHERE                                                                       
   (S.EXERCICIO =2001) AND
   (S.PERIODO  <= 12) AND                                           
   (S.IDPESSOA = 14185)                                              
GROUP BY                                                                    
   S.IDCONTAORCAMEN,S.IDPLANOORCAMEN                                  
UNION ALL 
SELECT
   S.IDCONTAORCAMEN,S.IDPLANOORCAMEN,                                  
   ROUND(SUM(NVL(S.VLRORCADO,0)),2) AS VLRORCADOACUM,             
   ROUND(SUM(NVL(S.VLRREALIZADO,0)),2) AS VLRREALIZADOACUM, 
   (0) AS VLRORCADO,                      
   (0) AS VLRREALIZADO                    
FROM                                                                        
    SALDOORCADOANT S                                                        
WHERE                                                                       
   (S.EXERCICIO = 2001) AND
   (S.IDPESSOA =  14185)
GROUP BY
   S.IDPLANOORCAMEN, S.IDCONTAORCAMEN) U,
CONTASORCAMEN C,
GRUPOORCAMEN G
WHERE
   (C.IDPLANOORCAMEN = U.IDPLANOORCAMEN) AND
   (C.IDCONTAORCAMEN = U.IDCONTAORCAMEN) AND
   (C.IDGRUPOORCAMEN = G.IDGRUPOORCAMEN)
GROUP BY
   G.NOMEGRUPOORCAMEN, C.NOMECONTAORCAMEN,
   G.FLGSINALGRUPO, G.CODGRUPOORC, U.IDCONTAORCAMEN
HAVING
   (SUM(NVL(U.VLRORCADOACUM,0)) <> 0) OR
   (SUM(NVL(U.VLRREALIZADOACUM,0)) <> 0) OR
   (SUM(NVL(U.VLRORCADO,0)) <> 0) OR
   (SUM(NVL(U.VLRREALIZADO,0)) <> 0)
ORDER  BY
   G.CODGRUPOORC, U.IDCONTAORCAMEN                                          

//query antiga


SELECT
   U.FLGSINALGRUPO, U.CODGRUPOORC, U.IDCONTAORCAMEN,
   U.NOMEGRUPOORCAMEN, U.NOMECONTAORCAMEN,
   SUM(U.VLRORCADOACUM) AS VLRORCADOACUM,
   SUM(U.VLRREALIZADOACUM) AS VLRREALIZADOACUM,
   SUM(U.VLRORCADO) AS VLRORCADO,
   SUM(U.VLRREALIZADO) AS VLRREALIZADO
FROM (
SELECT  /*+ index (SALDOORCADO XIF4223SALDOORCADO) */
   G.FLGSINALGRUPO, G.CODGRUPOORC, S.IDCONTAORCAMEN,
   G.NOMEGRUPOORCAMEN, C.NOMECONTAORCAMEN,
   (0) AS VLRORCADOACUM,
   (0) AS VLRREALIZADOACUM,
   ROUND(SUM(DECODE(S.VLRORCADO,NULL,0,DECODE(C.FLGSINALCONTA,'P',S.VLRORCADO,(S.VLRORCADO*-1)))),2) AS VLRORCADO,
   ROUND(SUM(DECODE(S.VLRREALIZADO,NULL,0,DECODE(C.FLGSINALCONTA,'P',S.VLRREALIZADO,(S.VLRREALIZADO*-1)))),2) AS VLRREALIZADO
FROM
    GRUPOORCAMEN G,
    CONTASORCAMEN C,
    SALDOORCADO S
WHERE
   (S.EXERCICIO =:EXERCICIO) AND
   (S.PERIODO  = :PERIODOINI) AND
   (S.IDPESSOA = :IDPESSOA) AND
   (C.IDPLANOORCAMEN = S.IDPLANOORCAMEN) AND
   (C.IDCONTAORCAMEN = S.IDCONTAORCAMEN) AND
   (C.IDGRUPOORCAMEN = G.IDGRUPOORCAMEN)
GROUP BY
   G.NOMEGRUPOORCAMEN, C.NOMECONTAORCAMEN,
   G.FLGSINALGRUPO, G.CODGRUPOORC, S.IDCONTAORCAMEN
UNION ALL
SELECT  /*+ index (SALDOORCADO XIF4223SALDOORCADO) */
   G.FLGSINALGRUPO, G.CODGRUPOORC, S.IDCONTAORCAMEN,
   G.NOMEGRUPOORCAMEN, C.NOMECONTAORCAMEN,
   ROUND(SUM(DECODE(S.VLRORCADO,NULL,0,DECODE(C.FLGSINALCONTA,'P',S.VLRORCADO,(S.VLRORCADO*-1)))),2) AS VLRORCADOACUM,
   ROUND(SUM(DECODE(S.VLRREALIZADO,NULL,0,DECODE(C.FLGSINALCONTA,'P',S.VLRREALIZADO,(S.VLRREALIZADO*-1)))),2) AS VLRREALIZADOACUM,
   (0) AS VLRORCADO,
   (0) AS VLRREALIZADO
FROM
    GRUPOORCAMEN G,
    CONTASORCAMEN C,
    SALDOORCADO S
WHERE
   (S.EXERCICIO =:EXERCICIO) AND
   (S.PERIODO <= :PERIODOINI) AND
   (S.IDPESSOA = :IDPESSOA) AND
   (C.IDPLANOORCAMEN = S.IDPLANOORCAMEN) AND
   (C.IDCONTAORCAMEN = S.IDCONTAORCAMEN) AND
   (C.IDGRUPOORCAMEN = G.IDGRUPOORCAMEN)
GROUP BY
   G.NOMEGRUPOORCAMEN, C.NOMECONTAORCAMEN,
   G.FLGSINALGRUPO, G.CODGRUPOORC, S.IDCONTAORCAMEN) U
GROUP BY
   U.NOMEGRUPOORCAMEN, U.NOMECONTAORCAMEN,
   U.FLGSINALGRUPO, U.CODGRUPOORC, U.IDCONTAORCAMEN
ORDER  BY
   U.CODGRUPOORC, U.IDCONTAORCAMEN
 }

end.





