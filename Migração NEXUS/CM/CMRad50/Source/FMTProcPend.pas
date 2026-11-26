unit FMTProcPend;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  DBClient, uCMClientDataSet, uCmSqlParams, Wwdatsrc, Db, DBCtrls, Grids,
  Wwdbigrd, Wwdbgrid, ExtCtrls, TB97Tlbr, TB97, MontaSelect;

type
  TFrmMTProcPend = class(TfrmSairAjuda)
    dbgrdDet: TwwDBGrid;
    Splitter1: TSplitter;
    plnBem: TPanel;
    memOBS: TDBMemo;
    plnCapBem: TPanel;
    ds: TwwDataSource;
    BtnView: TBitBtn;
    Sql: TCMSqlParams;
    Cds: TCMClientDataSet;
    MsPp: TMontaSelect;
    BtnProcurar: TBitBtn;
    BtnExcluir: TBitBtn;
    CdsEtapa: TCMClientDataSet;
    SqlEtapa: TCMSqlParams;
    procedure FormCreate(Sender: TObject);
    procedure BtnViewClick(Sender: TObject);
    procedure BtnProcurarClick(Sender: TObject);
    procedure SqlFormartParam(sParamName, sOldValue: String;
      var sNewValue: String);
    procedure BtnExcluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    sIdProcs: String;
  end;

var
  FrmMTProcPend: TFrmMTProcPend;

implementation

{$R *.DFM}

Uses uSistema, FMTAcompProc, uMensErro, DBasedados, uCtrlRad;

procedure TFrmMTProcPend.FormCreate(Sender: TObject);
begin
  inherited;
  MsPp.Filtro.Add( 'RADINSTPROCESSO.IDUSUARIO = ' + FloatToStr( Sistema.IdUsuario ) );
(*
  Cds.Close;
  Sql.Prepare;
  Sql.ParamByName( 'pIDUSUARIO' ).AsFloat := Sistema.IdUsuario;
  Sql.Open;  *)
end;

procedure TFrmMTProcPend.BtnViewClick(Sender: TObject);
begin
  inherited;
  Application.CreateForm( TFrmMTAcompProc, FrmMTAcompProc );
  FrmMTAcompProc.sTipoProc := Cds.FieldByName( 'NOMEPROC' ).asString;
  FrmMTAcompProc.sObs      := Cds.FieldByName( 'OBS' ).asString;
  FrmMTAcompProc.iNumProc  := Cds.FieldByName( 'IDPROCESSO' ).asInteger;
  FrmMTAcompProc.sPessoa   := Cds.FieldByName( 'RAZAOSOCIAL' ).asString;
  FrmMTAcompProc.sDoc      := Cds.FieldByName( 'NUMDOCUMENTO' ).asString;
  FrmMTAcompProc.sUsuario  := Cds.FieldByName( 'NOMEUSUARIO' ).asString;
  FrmMTAcompProc.sSituacao := Cds.FieldByName( 'FLGOK' ).asString;
  FrmMTAcompProc.FormStyle := fsNormal;
  FrmMTAcompProc.Visible   := False;
  FrmMTAcompProc.ShowModal;
  FrmMTAcompProc.Free;
end;

procedure TFrmMTProcPend.BtnProcurarClick(Sender: TObject);
begin
  inherited;
  If MsPp.Executar = MrOk Then Begin
     sIdProcs := MsPp.ValoresChave[ 0 ];

     While MsPp.GetNextSelected Do
           sIdProcs := sIdProcs + ',' + MsPp.ValoresChave[ 0 ];
  End Else Begin
     sIdProcs := '';
  End;

  Cds.DisableControls;
  Cds.Close;
  Sql.Prepare;
  Sql.Open;
  Cds.EnableControls;
  BtnExcluir.Enabled := Not Cds.IsEmpty;
  BtnView.Enabled    := Not Cds.IsEmpty;
end;

procedure TFrmMTProcPend.SqlFormartParam(sParamName, sOldValue: String;
  var sNewValue: String);
begin
  inherited;
  If sParamName = 'IDPROCS' Then
     sNewValue := sIdProcs;
end;

procedure TFrmMTProcPend.BtnExcluirClick(Sender: TObject);
var
  Rad: TCtrlRad;
begin
  inherited;
  Try
     Rad := TCtrlRad.Create();
     Rad.Initialize( dtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
                     Sistema.ConnectionSide, Sistema.AppRemoteServer, True );
     SqlEtapa.Prepare;
     SqlEtapa.ParamByName( 'PIDPROCESSO' ).AsFloat := Cds.FieldByName( 'IDPROCESSO' ).AsFloat;
     SqlEtapa.Open;

     If CdsEtapa.FieldByName( 'QTDETAPAS' ).AsFloat > 0 Then Begin
        MsgDlg( 'Não é possível excluir este processo pois o mesmo já possui etapa(s) executada(s).', 'Exclusão de Processo', MtInformation, [MbOk], 0 );
     End Else Begin
        If MsgDlg( 'Confirma a exclusão deste Processo?', 'Exclusão de Processo', MtConfirmation, [MbYes, MbNo], 0 ) = MrYes Then Begin
           Try
              // Exclui fisicamente
              RAD.ExcluirProcesso( Cds.FieldByName( 'IDPROCESSO' ).AsFloat );
              // Exclui do CDS
              Cds.Delete;
           Except
              On Exception Do
                 MsgDlg( 'Não foi possível excluir este processo.', 'Exclusão de Processo', MtInformation, [MbOk], 0 );
           End;
        End;
     End;
  Finally
     Rad.Free;
     CdsEtapa.Close;
  End;

  BtnExcluir.Enabled := Not Cds.IsEmpty;
  BtnView.Enabled    := Not Cds.IsEmpty;
end;

procedure TFrmMTProcPend.FormShow(Sender: TObject);
begin
  inherited;
  sIdProcs := '';
  Cds.DisableControls;
  Cds.Close;
  Sql.Prepare;
  Sql.Open;
  Cds.EnableControls;
end;

end.


(*  SQL Original

 SELECT DISTINCT
       IP.IDPROCESSO,
       IP.DATAINIPROCESSO,
       IP.DATAFIMPREV AS DATAFIMPROC,
       IP.IDTIPOPROCESSO,
       TP.NOME AS NOMEPROC,
       IP.OBS,
       IP.CODCENTROCUSTO,
       IP.IDEMPRESA,
       IP.UNIDNEGOC,
       IP.IDPESSOA,
       IP.CODGRUPOPROD,
       IP.CODCENTRORESPON,
       IP.VLRPROC,
       P.RAZAOSOCIAL,
       P.NUMDOCUMENTO,
       U.NOMEUSUARIO
  FROM
       PESSOA P,
       RADINSTPROCESSO IP,
       RADTIPOPROCESSO TP,
       RADRESPONXGRP GRP,
       RADGRAUTXGRRESPON AUT,
       RADRESPONXGRP GRPAUT,
       USUARIOSISTEMA U
 WHERE
       ( IP.FLGOK = 'N' )
   AND ( ( GRP.IDUSUARIO = :pIDUSUARIO ) OR ( GRPAUT.IDUSUARIO = :pIDUSUARIO ) )
   AND ( IP.IDTIPOPROCESSO = TP.IDTIPOPROCESSO )
   AND ( IP.IDPESSRESP = P.IDPESSOA(+) )
   AND ( TP.IDGRPGESTOR = GRP.IDGRPRESPON )
   AND ( TP.IDGRPCONSULTA = AUT.IDGRUPOAUTORIZA )
   AND ( AUT.IDGRPRESPON = GRPAUT.IDGRPRESPON )
   AND ( IP.IDUSUARIO = U.IDUSUARIO )
 ORDER BY IP.DATAFIMPREV



 select para utilizar ocm o Montaselect

 SELECT DISTINCT
       IP.IDPROCESSO,
       IP.DATAINIPROCESSO,
       IP.DATAFIMPREV AS DATAFIMPROC,
       IP.IDTIPOPROCESSO,
       TP.NOME AS NOMEPROC,
       IP.OBS,
       IP.CODCENTROCUSTO,
       IP.IDEMPRESA,
       IP.UNIDNEGOC,
       IP.IDPESSOA,
       IP.CODGRUPOPROD,
       IP.CODCENTRORESPON,
       IP.VLRPROC,
       P.RAZAOSOCIAL,
       P.NUMDOCUMENTO,
       U.NOMEUSUARIO
  FROM
       PESSOA P,
       RADINSTPROCESSO IP,
       RADTIPOPROCESSO TP,
       RADRESPONXGRP GRP,
       RADGRAUTXGRRESPON AUT,
       RADRESPONXGRP GRPAUT,
       USUARIOSISTEMA U
 WHERE 
            ( IP.IDPROCESSO IN ( :IDPROCS ) )
   AND ( IP.IDTIPOPROCESSO = TP.IDTIPOPROCESSO )
   AND ( IP.IDPESSRESP = P.IDPESSOA(+) )
   AND ( TP.IDGRPGESTOR = GRP.IDGRPRESPON )
   AND ( TP.IDGRPCONSULTA = AUT.IDGRUPOAUTORIZA )
   AND ( AUT.IDGRPRESPON = GRPAUT.IDGRPRESPON )
   AND ( IP.IDUSUARIO = U.IDUSUARIO )
 ORDER BY DATAFIMPROC

*)

