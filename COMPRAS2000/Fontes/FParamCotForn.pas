// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  27/02/2009
// Pendência   : SOL 109421 KINTANA 496332
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit FParamCotForn;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, CMProcuraSubTipo, Db, DBTables, Wwquery,
  wwdblook, CMDBLookupCombo;

type
  TFrmParamCotForn = class(TfrmOkCancelar)
    cmpForn: TCMProcuraForCli;
    dblcProc: TCMDBLookupCombo;
    qryProc: TwwQuery;
    Label1: TLabel;
    qryProcCODPROCESSO: TFloatField;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    Procedure FazRel;
  public
    { Public declarations }
  end;

var
  FrmParamCotForn: TFrmParamCotForn;

implementation

{$R *.DFM}

Uses DRelCompras, uMensErro, uSistema, uModulo;

Procedure TFrmParamCotForn.FazRel;
Begin
  DtmRelCompras.lnLinha1.Visible      := False;
  DtmRelCompras.lnLinha2.Visible      := False;
  DtmRelCompras.lnLinha3.Visible      := False;
  DtmRelCompras.lbCotAssinat1.Visible := False;
  DtmRelCompras.lbCotAssinat2.Visible := False;
  DtmRelCompras.lbCotAssinat3.Visible := False;
  If Trim(Modulo.sAssinatura1) <> '' Then
     Begin
        DtmRelCompras.lnLinha1.Visible      := True;
        DtmRelCompras.lbCotAssinat1.Visible := True;
        DtmRelCompras.lbCotAssinat1.Caption := Modulo.sAssinatura1;
     End;
  If Trim(Modulo.sAssinatura2) <> '' Then
     Begin
        DtmRelCompras.lnLinha2.Visible      := True;
        DtmRelCompras.lbCotAssinat2.Visible := True;
        DtmRelCompras.lbCotAssinat2.Caption := Modulo.sAssinatura2;
     End;
  If Trim(Modulo.sAssinatura3) <> '' Then
     Begin
        DtmRelCompras.lnLinha3.Visible      := True;
        DtmRelCompras.lbCotAssinat3.Visible := True;
        DtmRelCompras.lbCotAssinat3.Caption := Modulo.sAssinatura3;
     End;

  DtmRelCompras.LbTituloCotForn.Caption := 'Resultado da Cotação do processo Nº '+dblcProc.Text;
  DtmRelCompras.qryAgregCotForn.Open;
  With DtmRelCompras.qryCotForn Do
     Begin
          Close;
          Sql.Clear;
          Sql.Add(' SELECT                                                  ');
          Sql.Add('      C.CODPROCESSO,                                     ');
          Sql.Add('      C.IDFORCLI,                                        ');
          Sql.Add('      C.IDPROCXART,                                      ');
          Sql.Add('      C.PROPOSTA,                                        ');
          Sql.Add('      C.QTDEFORNECIDA,                                   ');
          Sql.Add('      C.PRECO,                                           ');
          Sql.Add('      C.CODMEDIDA,                                       ');
          Sql.Add('      C.STATUS,                                          ');
          Sql.Add('      C.PRECOAVALORPRES,                                 ');
          Sql.Add('      (C.PRECO * QTDEFORNECIDA) AS VALORTOTAL,           ');
          Sql.Add('      PP.DATAPGTO,                                       ');
          Sql.Add('      PE.DATAENT,                                        ');
          Sql.Add('      PXA.CODARTIGO,                                     ');
          Sql.Add('      PXA.DATANECESSIDADE,                               ');
          Sql.Add('      DECODE(PXA.JUSTIFICATIVA,NULL,'''',''JUSTIFICATIVA : '' ||PXA.JUSTIFICATIVA) AS  JUSTIFICATIVA,');
          Sql.Add('      DECODE(PXA.IDPRODVARI,NULL,PR.DESCPROD,PV.DESCPRODVARI) AS DESCRICAO,');
          Sql.Add('      P.RAZAOSOCIAL,                                                       ');
          Sql.Add('      DECODE(PC.STATUS,''F'',''O.C. JÁ GERADA'',''O.C. NÃO GERADA'') AS STATUSOC,');
          Sql.Add('      UC.FORMECEDOR AS FORNECEDOR,                                         ');
          Sql.Add('      UC.QTDE,                                                             ');
          Sql.Add('      UC.DATAULTCOMP,                                                      ');
          Sql.Add('      UC.VALUNIT,                                                          ');
          Sql.Add('      UC.UNID,                                                             ');
          Sql.Add('      DECODE(UC.VALUNIT,NULL,0,((C.PRECO - UC.VALUNIT)*100)/UC.VALUNIT) AS VARIACAO ');
          Sql.Add(' FROM                   ');
          Sql.Add('     PESSOA P,          ');
          Sql.Add('     COTACOES C,        ');
          Sql.Add('     PROCXART PXA,      ');
          Sql.Add('     PRODUTO PR,        ');
          Sql.Add('     ARTIGO A,          ');
          Sql.Add('     PRODVARI PV,       ');
          Sql.Add('     PRAZOPGTO PP,      ');
          Sql.Add('     PRAZOENTREGA PE,   ');
          Sql.Add('     PROCESSO PC,       ');
          Sql.Add('     VWULTCOMPRA UC     ');
          Sql.Add(' WHERE  (C.CODPROCESSO  = '+dblcProc.Text+')');
          Sql.Add('   AND (PC.CODPROCESSO = '+dblcProc.Text+') ');
          If Trim(cmpForn.Text) <> '' Then
             Sql.Add('   AND (C.IDFORCLI = '+IntToStr(cmpForn.ForCliReg.Id)+') ');
          Sql.Add('   AND (C.IDPROCXART   = PXA.IDPROCXART)    ');
          Sql.Add('   AND (C.CODPROCESSO  = PXA.CODPROCESSO)   ');
          Sql.Add('   AND (C.IDFORCLI     = P.IDPESSOA)        ');
          Sql.Add('   AND (PXA.CODARTIGO  = A.CODARTIGO)       ');
          Sql.Add('   AND (A.CODPRODUTO   = PR.CODPRODUTO)     ');
          Sql.Add('   AND (PXA.IDPRODVARI = PV.IDPRODVARI(+))  ');
          Sql.Add('   AND (PP.IDPROCXART(+)  = C.IDPROCXART)   ');
          Sql.Add('   AND (PP.CODPROCESSO(+) = C.CODPROCESSO)  ');
          Sql.Add('   AND (PXA.CODARTIGO     = UC.CODARTIGO(+))');
          Sql.Add('   AND (UC.IDPESSOA(+) = '+IntToStr(Sistema.IdEmpresa)+')');
          Sql.Add('   AND (PP.IDFORCLI(+)    = C.IDFORCLI)     ');
          Sql.Add('   AND (PP.PROPOSTA(+)    = C.PROPOSTA)     ');
          Sql.Add('   AND (PE.IDPROCXART(+)  = C.IDPROCXART)   ');
          Sql.Add('   AND (PE.CODPROCESSO(+) = C.CODPROCESSO)  ');
          Sql.Add('   AND (PE.IDFORCLI(+)    = C.IDFORCLI)     ');
          Sql.Add('   AND (PE.PROPOSTA(+)    = C.PROPOSTA)     ');
          Sql.Add(' ORDER BY P.RAZAOSOCIAL,PROPOSTA,DECODE(PXA.IDPRODVARI,NULL,PR.DESCPROD,PV.DESCPRODVARI)');
          //sqL.SAVEtOFILE('c:\CHABU.SQL');
          sqL.SAVEtOFILE(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\CHABU.SQL');//Ádler Teodoro de Souza SOL 109421 KINTANA 496332
          Open;
     End;
End;

procedure TFrmParamCotForn.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  If Trim(dblcProc.Text) = '' Then
     Begin
        MsgDlg('Selecione o Processo','Erro',mtError,[mbOk],0);
        dblcProc.SetFocus;
        ModalResult := mrNone;
     End
  Else
     Begin
        FazRel;
        ModalResult := mrOK;        
     End;
end;

procedure TFrmParamCotForn.FormCreate(Sender: TObject);
begin
  inherited;
  qryProc.Close;
  qryProc.Params[0].AsInteger := Sistema.IdUsuario;
  qryProc.Open;
end;

end.
