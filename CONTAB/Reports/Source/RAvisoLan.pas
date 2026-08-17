{
Rotina ......: CrmRptCMBeforePrint, rptAvisoLan (visual)
SOL..........: 190984
Kintana......: 1813669
Data.........: 02/10/2012
Responsável..: Edilaine Ferraresi
Descrição....: na query em beforeprint colocado um TRIM para o campo NOMEPLANOPREV e alterada
               a propriedade autosize do componente usado pelo campo NOMEPLANOPREV para FALSE
--------------------------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 190446
Nº KINTANA..: 1802221
Data........: 19/09/2012
Responsável.: Helen V. Bianchi
Descrição...: Alterar apenas layout do relatório e substituir a nomenclatura de Nº A.P.
              para Nº A.P / A.R.
--------------------------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 144332
Nº KINTANA..: 999953
Data........: 10/08/2011
Responsável.: Thaise Amaral Martins
Descrição...: Adicionar quebra de linha no nome da conta
-------------------------------------------------------------------------------------------------- }

//======================================================================
// Autor     : Augusto
// Data      : 13/11/2007
// Pendência : 25356
// Descrição : Ajustes no relatório por AP
//======================================================================
// Autor     : Rodolpho da Silva
// Data      : 17/02/2005
// Pendência : 18512
// Descrição : Incluir o campo NOME (centro de custo) na qry
//======================================================================
// Aualizado por: andre tavares - pendência 16948 - 25/06/2004 -
// imnplementação dos filtros Plano e Patro e disponibilização dos campos
// PLANOME, NOMECENTCUST, TOTALLANCCRED e TOTALLANCDEB
unit RAvisoLan;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCmReport, uCmRptManager, TXComp, CmParamReport, uCmSqlParams, Db,uCtrlRptBalancete,
  DBClient, uCMClientDataSet, Wwdatsrc, ppDB, ppDBPipe, ppDBBDE, ppBands,
  ppClass, ppVar, ppCtrls, ppStrtch, ppMemo, ppPrnabl, ppCache, ppComm,uCMfileUtils,
  ppRelatv, ppProd, ppReport,uCtrlPeriodo,uSistema,uCtrlRptAvisoLan,
  ppModule, raCodMod, TXRB, ppParameter;

type
  TRptAvisoLan = class(TFrmCmReport)
    rptAvisoLan: TppReport;
    pplAvisoLan: TppBDEPipeline;
    dsAvisoLan: TwwDataSource;
    cdsAvisoLan: TCMClientDataSet;
    sqlAvisoLan: TCMSqlParams;
    sqlPlanilSRef: TCMSqlParams;
    cdsPlanilSRef: TCMClientDataSet;
    ppParameterList1: TppParameterList;
    ppHeaderBand16: TppHeaderBand;
    ppDetailBand11: TppDetailBand;
    rptAvisoLanLine15: TppLine;
    rptAvisoLanLine10: TppLine;
    ppDBText2: TppDBText;
    rptAvisoLanLine8: TppLine;
    rptAvisoLanLine9: TppLine;
    rptAvisoLanLine12: TppLine;
    rptAvisoLanDBText4: TppDBText;
    rptAvisoLanDBText5: TppDBText;
    rptAvisoLanLine16: TppLine;
    ppDBText9: TppDBText;
    ppDBText1: TppDBText;
    rptAvisoLanLine13: TppLine;
    ppLine2: TppLine;
    rptAvisoLanDBText3: TppDBText;
    rptAvisoLanDBMemo1: TppDBMemo;
    ppFooterBand16: TppFooterBand;
    rptAvisoLanShape3: TppShape;
    LblSistema: TppLabel;
    rptAvisoLanLine17: TppLine;
    rptAvisoLanLabel9: TppLabel;
    rptAvisoLanDBText6: TppDBText;
    rptAvisoLanLabel10: TppLabel;
    rptAvisoLanLine18: TppLine;
    ppCalc11: TppSystemVariable;
    ppCalc17: TppSystemVariable;
    rptAvisoLanGroup1: TppGroup;
    rptAvisoLanGroupHeaderBand1: TppGroupHeaderBand;
    rptAvisoLanShape1: TppShape;
    ppLabel2: TppLabel;
    rptAvisoLanLine1: TppLine;
    rptAvisoLanLine2: TppLine;
    rptAvisoLanLabel11: TppLabel;
    rptAvisoLanDBText7: TppDBText;
    rptAvisoLanLabel12: TppLabel;
    ppLabel9: TppLabel;
    rptAvisoLanGroupFooterBand1: TppGroupFooterBand;
    ppMemoAvisoAP: TppMemo;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppShape2: TppShape;
    rptAvisoLanShape2: TppShape;
    rptAvisoLanLine14: TppLine;
    rptAvisoLanLabel1: TppLabel;
    rptAvisoLanDBText1: TppDBText;
    rptAvisoLanLabel2: TppLabel;
    rptAvisoLanDBText2: TppDBText;
    rptAvisoLanLine5: TppLine;
    rptAvisoLanLabel3: TppLabel;
    rptAvisoLanLabel4: TppLabel;
    rptAvisoLanLine6: TppLine;
    rptAvisoLanLine7: TppLine;
    rptAvisoLanLabel5: TppLabel;
    rptAvisoLanLabel6: TppLabel;
    rptAvisoLanLine11: TppLine;
    rptAvisoLanLabel7: TppLabel;
    rptAvisoLanLabel8: TppLabel;
    ppLine1: TppLine;
    ppLabel4: TppLabel;
    ppLine3: TppLine;
    ppLabel5: TppLabel;
    ppDBText4: TppDBText;
    ppLabel6: TppLabel;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLine4: TppLine;
    ppLabel1: TppLabel;
    ppLabel8: TppLabel;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppLine36: TppLine;
    ppLine7: TppLine;
    ppVariable1: TppVariable;
    ppVariable2: TppVariable;
    ppLabel3: TppLabel;
    ppLabel7: TppLabel;
    raCodeModule1: TraCodeModule;
    ppDBMemo1: TppDBMemo;
    ppDBMemo2: TppDBMemo;
    procedure CrmRptCMBeforePrint(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    CtrlPeriodo     :TCtrlPeriodo;
    CtrlRptAvisoLan :TCtrlRptAvisoLan;
    CtrlRptBalancete :TCtrlRptBalancete;

  public
    { Public declarations }
  end;

var
  RptAvisoLan: TRptAvisoLan;

implementation

uses uCtrlPadroes,UMensErro, uDatabase, DBaseDados,
     uModulo, uFuncaoGeral;

{$R *.DFM}

procedure TRptAvisoLan.CrmRptCMBeforePrint(Sender: TObject);
Var
    xx         : Integer;
    sPlanilhas : String;
    bPrimVez   : Boolean;
    iAno,iMes,iDia : Word;
    sMsg : string;
begin
  inherited;

  Try
      sMsg := 'Erro!';

         if not CtrlPeriodo.RetornaPeriodoExercicioData(CrmRptCM.IdEmpresa,DateToStr(CmpRptCM.ParamValues[0].AsDateTime)) then begin
           CtrlRptAvisoLan.PlnCodigo := '';
           sMsg := 'A data de planilha deve ser preenchida.';
         end;

       sPlanilhas := '';
       bPrimVez   := True;
       for xx := 0 to (CmpRptCM.Params.Count - 1) do begin
          if (CmpRptCM.ParamValues[xx].Name = 'MARCADO') then begin
             if CmpRptCM.ParamValues[xx].Value <> 0 then begin
                if not bPrimVez then begin
                   sPlanilhas:=sPlanilhas + ','+IntToStr(CmpRptCM.ParamValues[xx].Value);
                end else begin
                   sPlanilhas:=sPlanilhas + IntToStr(CmpRptCM.ParamValues[xx].Value);
                   bPrimVez := false;
                end;
             end;
          end;
       end;


       with sqlPlanilSRef do
       begin
          SQL.Clear;
          case CmpRptCM.ParamValues[15].AsInteger of
              // Faixa planilha
              0: begin
                    SQL.Add('SELECT P.PLNCODIGO, 0 AS CODDOCUMENTO, P.PLNPLANIL, ');
                    SQL.Add('     0 AS NUMAPGR, P.PLNREFERENCIA');
                    SQL.Add('FROM PLANILHA P');
                    SQL.Add('WHERE (P.PLNDATDIA = TO_DATE(' + QuotedStr(DateToStr(CmpRptCM.ParamValues[0].AsDateTime)) + ',''DD/MM/YYYY'')) AND');
                    SQL.Add('      ((P.PLNPLANIL IN (' + sPlanilhas + ')) OR  ((P.PLNPLANIL >= ' + IntToStr(CmpRptCM.ParamValues[2].AsInteger) +
                                                                       ') AND (P.PLNPLANIL  <= ' + IntToStr(CmpRptCM.ParamValues[3].AsInteger) + ')))');
                end;

             // Faixa de AP's
             1: begin
                   SQL.Add('SELECT P.PLNCODIGO, L.CODDOCUMENTO, P.PLNPLANIL,            ');
                   SQL.Add('    D.NUMAPGR, P.PLNREFERENCIA                              ');
                   SQL.Add('FROM LANCTODOCUM L, DOCUMENTO D, PLANILHA P                 ');
                   SQL.Add('WHERE (P.PLNCODIGO = L.PLNCODIGO) AND                       ');
                   SQL.Add('      (D.CODDOCUMENTO = L.CODDOCUMENTO) AND                 ');
                   SQL.Add('      ((D.NUMAPGR IN (' + sPlanilhas + ')) OR  ((D.NUMAPGR  >= ' + IntToStr(CmpRptCM.ParamValues[2].AsInteger) + ') AND ' +
                                                                          ' (D.NUMAPGR  <= ' + IntToStr(CmpRptCM.ParamValues[3].AsInteger) + ')) )');
                end;

              // Faixa plncodigo
              2: begin
                    SQL.Add('SELECT P.PLNCODIGO, 0 AS CODDOCUMENTO, P.PLNPLANIL, ');
                    SQL.Add('     0 AS NUMAPGR, P.PLNREFERENCIA');
                    SQL.Add('FROM PLANILHA P');
                    SQL.Add('WHERE ((P.PLNCODIGO IN (' + sPlanilhas + ')) OR  ((P.PLNCODIGO >= ' + IntToStr(CmpRptCM.ParamValues[2].AsInteger) +
                                                                       ') AND (P.PLNCODIGO  <= ' + IntToStr(CmpRptCM.ParamValues[3].AsInteger) + ')))');
                end;

          end;

          SQL.Add('  AND (P.IDPESSOA = '+FloatToStr(CrmRptCM.IdEmpresa)+') ');
          Open;

          
          if cdsPlanilSRef.IsEmpty then
          begin
            smsg := 'Não há planilha(s) com esses parâmetros';
            CtrlRptAvisoLan.PlnCodigo := ''
          end;


          If Not CtrlRptAvisoLan.ProcessaRptAvisoLan(CrmRptCM.IdEmpresa,CtrlPeriodo.Exercicio,CtrlPeriodo.Periodo,(CmpRptCM.ParamValues[15].AsInteger = 0)) Then
          begin
            sMsg := 'Não há planilha(s) com esses parâmetros';
            CtrlRptAvisoLan.PlnCodigo := '';
          end;
         end;

       if (CmpRptCM.ParamValues[15].AsInteger = 1) then
       begin
          rptAvisoLanLabel12.Caption    := 'No. A.P';
          rptAvisoLan.Groups[1].NewPage := False; { Augusto 12/11/2007  }
       end
       else
       begin
          DecodeDate(CmpRptCM.ParamValues[0].AsDateTime,iAno,iMes,iDia);
          rptAvisoLanLabel12.Caption := IntToStr(iMes)+'/'+IntToStr(iAno);
          rptAvisoLan.Groups[1].NewPage := True; { Augusto 12/11/2007  }
       end;

       with sqlAvisoLan do
       begin
          SQL.Clear;

         ppMemoAvisoAP.Visible := False;{ Augusto 17/11/2007 }

         if (
              ( CmpRptCM.ParamValues[15].AsInteger = 0 ) or
              ( CmpRptCM.ParamValues[15].AsInteger = 2 )
            ) then
         begin
            SQL.Add('SELECT P.PLNDATDIA, P.PLNPLANIL, L.LACNUMLAN, CC.NOME,   ');
            SQL.Add('       L.PLACONTA, L.HITCODHIST,  DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS PLANOME,      ');
            SQL.Add('       RTRIM(L.LACHIST1)||'' ''||RTRIM(L.LACHIST2)||'' ''||RTRIM(L.LACHIST3)||'' ''||RTRIM(L.LACHIST4)||'' ''||RTRIM(L.LACHIST5) AS HISTORICO, ');
            SQL.Add('       L.LACVALOR, L.LACDEBCRE,L.CODCENTROCUSTO, PE.NOME AS NOMEPATRO,TRIM(PP.NOME) AS NOMEPLANOPREV, ');  // Edilaine - SOL 190984 / KTN 1813669
            SQL.Add('       P.IDUSUARIOINCLUSAO, U.NOMEUSUARIO, P.PLNREFERENCIA   ');
            SQL.Add('       , CC.NOME AS NOMECENTCUST, TOTAISPLANILHA.TOTALLANCDEB, TOTAISPLANILHA.TOTALLANCCRED ');
            SQL.Add('FROM PLANILHA P, LANCAMENTO L, PLANOCONTA C, USUARIOSISTEMA U, PESSOA PE, PLANPREVCONTABIL PP, CENTCUST CC,');
            SQL.Add('(SELECT');
            SQL.Add('     L.PLNCODIGO,');
            SQL.Add('     SUM( DECODE( LACDEBCRE, ''C'', L.LACVALOR, 0 ) ) AS TOTALLANCCRED,');
            SQL.Add('     SUM( DECODE( LACDEBCRE, ''D'', L.LACVALOR, 0 ) ) AS TOTALLANCDEB');
            SQL.Add('FROM PLANILHA P, LANCAMENTO L, PLANOCONTA C, USUARIOSISTEMA U, PESSOA PE, PLANPREVCONTABIL PP');
            SQL.Add('WHERE ((P.PLNCODIGO = L.PLNCODIGO) AND (U.IDUSUARIO = P.IDUSUARIOINCLUSAO)');
            SQL.Add('  AND ((L.PLANO = C.PLANO) AND (L.PLACONTA = C.PLACONTA)))');
            SQL.Add('  AND (L.IDPATRO = PE.IDPESSOA(+))');
            if CtrlRptAvisoLan.PlnCodigo = '' then
               SQL.ADD(' AND (1 = 2) ')
            else
              SQL.Add('  AND (P.PLNCODIGO IN ('+ CtrlRptAvisoLan.PlnCodigo +'))');
            SQL.Add('  AND (L.IDPLANOPREV = PP.IDPLANOPREV(+))               ');
            SQL.Add('GROUP BY L.PLNCODIGO) TOTAISPLANILHA,                   ');

            SQL.Add(CtrlRptBalancete.SelecionaPlanoContaPer(CtrlPeriodo.Periodo,CtrlPeriodo.Exercicio,CrmRptCM.IdEmpresa)+' PD ');

            SQL.Add('WHERE ((P.PLNCODIGO   = L.PLNCODIGO) AND (U.IDUSUARIO = P.IDUSUARIOINCLUSAO) ');
            SQL.Add('  AND ((L.PLANO       = C.PLANO) AND (L.PLACONTA = C.PLACONTA))) ');
            SQL.Add('  AND (PD.PLACONTA(+) = C.PLACONTA)                              ');
            SQL.Add('  AND (PD.PLANO(+)    = C.PLANO)                                 ');
            SQL.Add('  AND (L.IDPATRO      = PE.IDPESSOA(+))                          ');
            SQL.Add('  AND (L.IDPLANOPREV  = PP.IDPLANOPREV(+))                       ');
            SQL.Add('  AND (CC.CODCENTROCUSTO(+) = L.CODCENTROCUSTO)                  ');
            SQL.Add('  AND (L.PLNCODIGO = TOTAISPLANILHA.PLNCODIGO)                   ');
            if trim(CmpRptCM.ParamValues[13].asString) <> '' then
              SQL.Add('  AND (L.IDPLANOPREV = '+ CmpRptCM.ParamValues[13].asString +')');

            if trim(CmpRptCM.ParamValues[14].asString) <> '' then
              SQL.Add('  AND (L.IDPATRO = '+ CmpRptCM.ParamValues[14].asString +')');


            if CtrlRptAvisoLan.PlnCodigo = '' then
               SQL.ADD(' AND (1 = 2) ')
            else
               SQL.ADD(' AND (P.PLNCODIGO IN ('+CtrlRptAvisoLan.PlnCodigo+')) ');

            SQL.Add('ORDER BY P.PLNDATDIA, P.PLNPLANIL, L.LACNUMLAN     ');
          end
          else { AP }
          begin

            { Inicio Augusto 12/11/2007                                        }
            { Refiz a consulta as dados da AP.                                 }

            SQL.Add('SELECT ');
            SQL.Add('  DOC.NUMAPGR AS PLNREFERENCIA, ');
            SQL.Add('  LDC.NUMLANCTO, LDC.OPERACAO, ');

            SQL.Add('  PLN.PLNCODIGO, PLN.PLNPLANIL,  PLN.PLNDATDIA,       PLN.IDUSUARIOINCLUSAO, ');
            SQL.Add('  PLN.PLNTOTDEB, PLN.PLNTOTCRE, ');

            SQL.Add('  USU.NOMEUSUARIO, ');

            SQL.Add('  LAN.PLACONTA,  LAN.LACNUMLAN,  LAN.LACVALOR,        LAN.LACDEBCRE,  ');
            SQL.Add('  LAN.IDPATRO,   LAN.HITCODHIST, LAN.CODCENTROCUSTO, ');

            SQL.Add('  RTRIM(LAN.LACHIST1)||'' ''||RTRIM(LAN.LACHIST2)||'' ''||RTRIM(LAN.LACHIST3)||'' ''|| ');
            SQL.Add('  RTRIM(LAN.LACHIST4)||'' ''||RTRIM(LAN.LACHIST5) AS HISTORICO, ');

            SQL.Add('  CDC.NOME AS NOMECENTCUST, ');
            SQL.Add('  PLC.PLANOME AS PLANOME, ');

            SQL.Add('  PESSPT.NOME AS NOMEPATRO, ');
            SQL.Add('  TRIM(PPC.NOME) AS NOMEPLANOPREV ');   // Edilaine - SOL 190984 / KTN 1813669

            SQL.Add('FROM ');
            SQL.Add('  DOCUMENTO DOC, LANCTODOCUM LDC, PLANILHA PLN, LANCAMENTO LAN, ');
            SQL.Add('  PESSOA PESSPT, USUARIO USU,     CENTCUST CDC, PLANOCONTA PLC, ');
            SQL.Add('  PLANPREVCONTABIL PPC ');

            SQL.Add('WHERE ');
            SQL.Add('      ( 1 = 1 ) ');

            If Trim(CmpRptCM.ParamValues[13].asString) <> ''
            Then SQL.Add('  AND ( LAN.IDPLANOPREV = '+ CmpRptCM.ParamValues[13].asString +' ) ');

            If trim(CmpRptCM.ParamValues[14].asString) <> ''
            Then SQL.Add('  AND ( LAN.IDPATRO = '+ CmpRptCM.ParamValues[14].asString +' ) ');

            SQL.Add('  AND ( ( DOC.NUMAPGR IN (' + sPlanilhas + ' ) ) OR ');
            SQL.Add('        ( ( DOC.NUMAPGR  >= ' + IntToStr(CmpRptCM.ParamValues[2].AsInteger) + ' ) AND ' +
                    '          ( DOC.NUMAPGR <= ' + IntToStr(CmpRptCM.ParamValues[3].AsInteger) + ' ) ) )' );

            { Augusto 17/11/2007                                               }
            { Listar somente os valores das APs selecionadas                   }
            ppMemoAvisoAP.Visible := True;
            If ( CmpRptCM.ParamValues[16].Value = False ) Then Begin

              SQL.Add('  AND ( ( DOC.CODDOCUMENTO =  LAN.CODDOCUMENTO ) OR ( LAN.CODDOCUMENTO IS NULL) ) ');

            End;

            SQL.Add('  AND ( DOC.CODDOCUMENTO      = LDC.CODDOCUMENTO ) ');
            SQL.Add('  AND ( LDC.PLNCODIGO         = PLN.PLNCODIGO ) ');
            SQL.Add('  AND ( PLN.IDUSUARIOINCLUSAO = USU.CODUSUARIO(+) ) ');
            SQL.Add('  AND ( PLN.PLNCODIGO         = LAN.PLNCODIGO ) ');
            SQL.Add('  AND ( LAN.IDPATRO           = PESSPT.IDPESSOA ) ');
            SQL.Add('  AND ( LAN.IDPLANOPREV       = PPC.IDPLANOPREV ) ');
            SQL.Add('  AND ( LAN.CODCENTROCUSTO    = CDC.CODCENTROCUSTO(+) ) ');

            SQL.Add('  AND ( LAN.PLANO             = PLC.PLANO ) ');
            SQL.Add('  AND ( LAN.PLACONTA          = PLC.PLACONTA ) ');


            SQL.Add('ORDER BY ');
            SQL.Add('  DOC.NUMAPGR, PLN.PLNPLANIL, LAN.LACNUMLAN ');

            (*
            SQL.Add('SELECT P.PLNDATDIA, P.PLNPLANIL, L.LACNUMLAN,    ');
            SQL.Add('       L.PLACONTA, L.HITCODHIST, DECODE(PD.PLANOME,NULL,C.PLANOME,PD.PLANOME) AS PLANOME,      ');
            SQL.Add('       RTRIM(L.LACHIST1)||'' ''||RTRIM(L.LACHIST2)||'' ''||RTRIM(L.LACHIST3)||'' ''||RTRIM(L.LACHIST4)||'' ''||RTRIM(L.LACHIST5) AS HISTORICO, ');
            SQL.Add('       L.LACVALOR, L.LACDEBCRE,L.CODCENTROCUSTO, PE.NOME AS NOMEPATRO,PP.NOME AS NOMEPLANOPREV, ');
            SQL.Add('       P.IDUSUARIOINCLUSAO, U.NOMEUSUARIO, P.PLNREFERENCIA   ');
            SQL.Add('       , CC.NOME AS NOMECENTCUST, TOTAISPLANILHA.TOTALLANCDEB, TOTAISPLANILHA.TOTALLANCCRED ');
            SQL.Add('FROM PLANILHA P, LANCAMENTO L, PLANOCONTA C, USUARIOSISTEMA U, PESSOA PE, PLANPREVCONTABIL PP, CENTCUST CC, ');

            SQL.Add(CtrlRptBalancete.SelecionaPlanoContaPer(CtrlPeriodo.Periodo,CtrlPeriodo.Exercicio,CrmRptCM.IdEmpresa)+' PD ');
            //
            SQL.Add(', (SELECT');
            SQL.Add('     L.PLNCODIGO,');
            SQL.Add('     SUM( DECODE( LACDEBCRE, ''C'', L.LACVALOR, 0 ) ) AS TOTALLANCCRED,');
            SQL.Add('     SUM( DECODE( LACDEBCRE, ''D'', L.LACVALOR, 0 ) ) AS TOTALLANCDEB');
            SQL.Add('FROM PLANILHA P, LANCAMENTO L, PLANOCONTA C, USUARIOSISTEMA U, PESSOA PE, PLANPREVCONTABIL PP');
            SQL.Add('WHERE ((P.PLNCODIGO = L.PLNCODIGO) AND (U.IDUSUARIO = P.IDUSUARIOINCLUSAO)');
            SQL.Add('  AND ((L.PLANO = C.PLANO) AND (L.PLACONTA = C.PLACONTA)))');
            SQL.Add('  AND (L.IDPATRO = PE.IDPESSOA(+))');
            SQL.Add('  AND (P.PLNCODIGO IN ('+ CtrlRptAvisoLan.PlnCodigo +'))');
            SQL.Add('  AND (L.IDPLANOPREV = PP.IDPLANOPREV(+))               ');
            SQL.Add('GROUP BY L.PLNCODIGO) TOTAISPLANILHA                    ');

            SQL.Add('WHERE ((P.PLNCODIGO = L.PLNCODIGO) AND (U.IDUSUARIO = P.IDUSUARIOINCLUSAO) ');
            SQL.Add('  AND ((L.PLANO = C.PLANO) AND (L.PLACONTA = C.PLACONTA))) ');
            SQL.Add('  AND (L.IDPATRO = PE.IDPESSOA(+))                         ');
            SQL.Add('  AND (L.IDPLANOPREV = PP.IDPLANOPREV(+))                  ');
            SQL.Add('  AND (CC.CODCENTROCUSTO(+) = L.CODCENTROCUSTO)            ');
            SQL.Add('  AND (L.PLNCODIGO = TOTAISPLANILHA.PLNCODIGO)             ');

            if trim(CmpRptCM.ParamValues[13].asString) <> '' then
              SQL.Add('  AND (L.IDPLANOPREV = '+ CmpRptCM.ParamValues[13].asString +')');

            if trim(CmpRptCM.ParamValues[14].asString) <> '' then
              SQL.Add('  AND (L.IDPATRO = '+ CmpRptCM.ParamValues[14].asString +')');

            if CtrlRptAvisoLan.PlnCodigo = '' then
               SQL.ADD(' AND (1 = 2) ')
            else
            begin
               SQL.ADD(' AND (P.PLNCODIGO IN ('+CtrlRptAvisoLan.PlnCodigo+')) ');
            SQL.Add(' AND (PD.PLACONTA(+) = C.PLACONTA)    ');
            end;
            SQL.Add('ORDER BY P.PLNDATDIA, P.PLNPLANIL, L.LACNUMLAN     ');
            *)

          end;

          Open;
           ppLabel6.Caption := 'Nº. A.P/A.R'; //Helen - SOL:190446 KTN: 1802221
       end;
   Except
     On E:Exception Do
     Begin

       cdsAvisoLan.Close;

       MsgDlg(sMsg, 'Contabilidade', mtWarning, [mbOK], 0);
     End;

   End;

end;

procedure TRptAvisoLan.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlPeriodo := TCtrlPeriodo.Create;
  CtrlPeriodo.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                  Sistema.AppRemoteServer,True,nil,nil,False);

  CtrlRptAvisoLan := TCtrlRptAvisoLan.Create;
  CtrlRptAvisoLan.Initialize(DtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,Sistema.ConnectionSide,
                  Sistema.AppRemoteServer,True,nil,nil,False);

  CtrlRptAvisoLan.cdsPlanilSRef := CdsPlanilSRef;

  CtrlRptBalancete := TCtrlRptBalancete.Create;
  CtrlRptBalancete.Initialize(DtmBaseDados.dbBaseDados,False,Sistema.ConnectionType,Sistema.ConnectionSide,
                  Sistema.AppRemoteServer,True,nil,nil,False);

end;

procedure TRptAvisoLan.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlPeriodo.Free;
  CtrlRptAvisoLan.free;
  CtrlRptBalancete.free;  
end;



end.
