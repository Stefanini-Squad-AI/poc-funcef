{*******************************************************************************
  Alterações:
********************************************************************************
//------------------------------------------------------------------------------
 Alex Pereira   23.06.2005

 No montaSelect - colocados os aliases para os campos chave e as colunas
 
//------------------------------------------------------------------------------
//------------------------------------------------------------------------------
 Alex Pereira   17.06.2005
 Sempre sincronizar as querys do MSEsp com o SQL devido ao médodo:  RetornaTipoVerificaUsu

 Novos Métodos: RetornaTipoVerificaUsu , VerificaUsuario
                Este médodo é utilizado para excluir as linhas do montaselect, caso o usuário ainda
                não esteja apto a autorizar o processo
 Novos Tipos: TVerificaUsu / TMSCds

 Criado a uCtrlEtapa
 metodos movidos para lá FazVerificaUsu

 -- retirada a parte da inteligência da tela de gerenciamento de usuário para uCtrlEtapa

 Pendência: converter o resto da tela e retirar os componentes com o final _lixo
            no Padrão 5.10.07 em diante.

//------------------------------------------------------------------------------
06/06/2005
Pendência 19386
alteração da queries do montaselect msep e do componete sqlParam sql.
        AND ((RADGRAUTXGRRESPON.CODTIPDOC = RADINSTPROCESSO.CODTIPDOC) OR (RADGRAUTXGRRESPON.CODTIPDOC IS NULL AND RADINSTPROCESSO.CODTIPDOC IS NOT NULL) OR (RADGRAUTXGRRESPON.CODTIPDOC IS NULL AND RADINSTPROCESSO.CODTIPDOC IS NULL))
        AND ((RADGRAUTXGRRESPON.UNIDNEGOC = RADINSTPROCESSO.UNIDNEGOC) OR (RADGRAUTXGRRESPON.UNIDNEGOC IS NULL AND RADINSTPROCESSO.UNIDNEGOC IS NOT NULL) OR (RADGRAUTXGRRESPON.UNIDNEGOC IS NULL AND RADINSTPROCESSO.UNIDNEGOC IS NULL))
        AND ((RADGRAUTXGRRESPON.CODCENTROCUSTO = RADINSTPROCESSO.CODCENTROCUSTO) OR (RADGRAUTXGRRESPON.CODCENTROCUSTO IS NULL AND RADINSTPROCESSO.CODCENTROCUSTO IS NOT NULL) OR (RADGRAUTXGRRESPON.CODCENTROCUSTO IS NULL AND RADINSTPROCESSO.CODCENTROCUSTO IS NULL))
        AND ((RADGRAUTXGRRESPON.CODCENTRORESPON = RADINSTPROCESSO.CODCENTRORESPON) OR (RADGRAUTXGRRESPON.CODCENTRORESPON IS NULL AND RADINSTPROCESSO.CODCENTRORESPON IS NOT NULL) OR (RADGRAUTXGRRESPON.CODCENTRORESPON IS NULL AND RADINSTPROCESSO.CODCENTRORESPON IS NULL))
        AND ((RADGRAUTXGRRESPON.VLRINICIAL <= RADINSTPROCESSO.VLRPROC ) OR ( RADGRAUTXGRRESPON.VLRINICIAL = 0 ) OR ( RADGRAUTXGRRESPON.VLRINICIAL IS NULL ))
        AND ((RADGRAUTXGRRESPON.VLRFINAL   >= RADINSTPROCESSO.VLRPROC ) OR ( RADGRAUTXGRRESPON.VLRFINAL = 0 ) OR ( RADGRAUTXGRRESPON.VLRFINAL IS NULL ))
//------------------------------------------------------------------------------
 Data      : 07/05/2005
 Autor     : André Tavares
 Pendência : 17624
 Descrição : substituido os filtros o filtros:
 (RADGRAUTXGRRESPON.CODCENTRORESPON = RADINSTPROCESSO.CODCENTRORESPON) OR (RADGRAUTXGRRESPON.CODCENTRORESPON IS NULL AND RADINSTPROCESSO.CODCENTRORESPON IS NOT NULL) OR (RADGRAUTXGRRESPON.CODCENTRORESPON IS NULL AND RADINSTPROCESSO.CODCENTRORESPON IS NULL)
 (RADGRAUTXGRRESPON.CODTIPDOC = RADINSTPROCESSO.CODTIPDOC) OR (RADGRAUTXGRRESPON.CODTIPDOC IS NULL AND RADINSTPROCESSO.CODTIPDOC IS NOT NULL) OR (RADGRAUTXGRRESPON.CODTIPDOC IS NULL AND RADINSTPROCESSO.CODTIPDOC IS NULL)
 (RADGRAUTXGRRESPON.UNIDNEGOC = RADINSTPROCESSO.UNIDNEGOC) OR (RADGRAUTXGRRESPON.UNIDNEGOC IS NULL AND RADINSTPROCESSO.UNIDNEGOC IS NOT NULL) OR (RADGRAUTXGRRESPON.UNIDNEGOC IS NULL AND RADINSTPROCESSO.UNIDNEGOC IS NULL)
 (RADGRAUTXGRRESPON.CODCENTROCUSTO(+) = RADINSTPROCESSO.CODCENTROCUSTO)
 (RADGRAUTXGRRESPON.VLRINICIAL <= RADINSTPROCESSO.VLRPROC ) OR ( RADGRAUTXGRRESPON.VLRINICIAL = 0 ) OR ( RADGRAUTXGRRESPON.VLRINICIAL IS NULL) OR (RADINSTPROCESSO.VLRPROC IS NULL)
 (RADGRAUTXGRRESPON.VLRFINAL   >= RADINSTPROCESSO.VLRPROC ) OR ( RADGRAUTXGRRESPON.VLRFINAL = 0 ) OR ( RADGRAUTXGRRESPON.VLRFINAL IS NULL) OR (RADINSTPROCESSO.VLRPROC IS NULL)

do montaselect msep e do componete sqlParam sql.
--------------------------------------------------------------------------------
 Data      : 22/12/2204
 Autor     : Flavio Dias
 Pendência :
 Descrição : Incluído "OR (RADINSTPROCESSO.VLRPROC IS NULL)" na cláusula where
             do componente sql
--------------------------------------------------------------------------------
 Componente: MsEp
 Data      : 03/03/2004
 Autor     : David Ayrolla
 Pendência : 15705
 Descrição : Incluído filtragem pelo no. do processo de compras.
--------------------------------------------------------------------------------
 Componente: MsEp
 Data      : 22/04/2004
 Autor     : David Ayrolla
 Pendência : 16221
 Descrição : Incluído filtragem pelo no. da OC.
--------------------------------------------------------------------------------}

unit FMTExecEtapa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  DBClient, uCMClientDataSet, Wwdatsrc, Db, Grids, Wwdbigrd, Wwdbgrid,
  DBCtrls, ExtCtrls, TB97Tlbr, TB97, cmFluxOper, uCmSqlParams, uCmMath,
  MontaSelect, uCtrlEtapa, uCtrlPadroes;

type
{Alex 17.06.05  TVerificaUsu = record
    idTipoProcesso  : integer;
    idTipoEtapa     : integer;
    idEtapa         : integer;
    idProcesso      : integer;
    codCentroCusto  : string;
    idEmpresa       : integer;  // chave cCusto
    codCentroRespon : string;
    idPessoa        : integer;  // chave cRespon
    codGrupoProd    : string;
    unidNegoc       : integer;
    VlrProc         : extended;
    codTipDoc       : integer;
  end;
  TMSCds = (TFMontaSelect,TFClientDataSet);  }

  TFrmMTExecEtapa = class(TfrmSairAjuda)
    btnExecutar: TBitBtn;
    plnBem: TPanel;
    memOBS: TDBMemo;
    plnCapBem: TPanel;
    Panel1: TPanel;
    dbgrdDet: TwwDBGrid;
    Splitter1: TSplitter;
    ds: TwwDataSource;
    cbAtualiza: TCheckBox;
    ToolbarSep971: TToolbarSep97;
    Cdsaux_lixo: TCMClientDataSet;
    Sql_lixo: TCMSqlParams;
    CdsObjRad: TCMClientDataSet;
    SqlObjRad: TCMSqlParams;
    SqlVerifUsuario_lixo: TCMSqlParams;
    CdsVerifUsuario_lixo: TCMClientDataSet;
    CdsVerifAutGrupo_lixo: TCMClientDataSet;
    SqlVerifAutGrupo_lixo: TCMSqlParams;
    CdsVerifSeq_lixo: TCMClientDataSet;
    SqlVerifSeq_lixo: TCMSqlParams;
    CdsVerifOu_lixo: TCMClientDataSet;
    SqlVerifOu_Lixo: TCMSqlParams;
    CdsJaAutorizou_lixo: TCMClientDataSet;
    SqlJaAutorizou_lixo: TCMSqlParams;
    MsEp: TMontaSelect;
    BtnProcurar: TBitBtn;
    Cdsaux_lixoIDPROCESSO: TFloatField;
    Cdsaux_lixoDATAINIPROCESSO: TDateTimeField;
    Cdsaux_lixoDATAFIMPROC: TDateTimeField;
    Cdsaux_lixoDATAFIMETAPA: TDateTimeField;
    Cdsaux_lixoIDTIPOPROCESSO: TFloatField;
    Cdsaux_lixoNOMEPROC: TStringField;
    Cdsaux_lixoOBS: TStringField;
    Cdsaux_lixoDATAINIETAPA: TDateTimeField;
    Cdsaux_lixoNOMEETAPA: TStringField;
    Cdsaux_lixoIDETAPA: TFloatField;
    Cdsaux_lixoIDMODULO: TFloatField;
    Cdsaux_lixoCODCENTROCUSTO: TStringField;
    Cdsaux_lixoIDEMPRESA: TFloatField;
    Cdsaux_lixoUNIDNEGOC: TFloatField;
    Cdsaux_lixoIDPESSOA: TFloatField;
    Cdsaux_lixoCODGRUPOPROD: TStringField;
    Cdsaux_lixoCODCENTRORESPON: TStringField;
    Cdsaux_lixoVLRPROC: TFloatField;
    Cdsaux_lixoIDPESSRESP: TFloatField;
    Cdsaux_lixoIDTIPOETAPA: TFloatField;
    Cdsaux_lixoRAZAOSOCIAL: TStringField;
    Cdsaux_lixoNUMDOCUMENTO: TStringField;
    Cdsaux_lixoNOMEMODULO: TStringField;
    Cdsaux_lixoNOMEUSUARIO: TStringField;
    Cdsaux_lixoCODTIPDOC: TFloatField;
    cds: TClientDataSet;
    cdsIDPROCESSO: TFloatField;
    cdsNOMEPROC: TStringField;
    cdsDATAINIPROCESSO: TDateTimeField;
    cdsDATAFIMPROC: TDateTimeField;
    cdsDATAINIETAPA: TDateTimeField;
    cdsDATAFIMETAPA: TDateTimeField;
    cdsOBS: TStringField;
    cdsNOMEETAPA: TStringField;
    cdsCODCENTROCUSTO: TStringField;
    cdsVLRPROC: TFloatField;
    cdsRAZAOSOCIAL: TStringField;
    cdsNUMDOCUMENTO: TStringField;
    cdsIDETAPA: TFloatField;
    cdsNOMEMODULO: TStringField;
    cdsNOMEUSUARIO: TStringField;
    cdsIDMODULO: TFloatField;
    cdsIDEMPRESA: TFloatField;
    cdsUNIDNEGOC: TFloatField;
    cdsIDPESSOA: TFloatField;
    cdsCODGRUPOPROD: TStringField;
    cdsCODCENTRORESPON: TStringField;
    cdsIDPESSRESP: TFloatField;
    cdsIDTIPOETAPA: TFloatField;
    cdsIDTIPOPROCESSO: TFloatField;
    cdsCODTIPDOC: TFloatField;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure btnExecutarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BtnProcurarClick(Sender: TObject);
    procedure Sql_lixoFormartParam(sParamName, sOldValue: String;
      var sNewValue: String);
    procedure MsEpAfterOpenCds(oCds: TClientDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    CtrlEtapa: TCtrlEtapa;

    Procedure FinalizaEtapa;

// Alex 17.06.05    function VerificaUsuario (const oCdsLocal: OleVariant; const sTipo: TMSCds): OleVariant;
// Alex 17.06.05    function FazVerificaUsu( tTVerificaUsu: TVerificaUsu ): Boolean;
// Alex 17.06.05    function RetornaTipoVerificaUsu(_CdsLocal: TClientDataSet; sTipo: TMSCds ): TVerificaUsu;

  public
    { Public declarations }
    sidEtapas: String;
    bExecutar: Boolean;
    procedure MostraEtapasPend( bPendentes: Boolean );
  end;

var
  FrmMTExecEtapa: TFrmMTExecEtapa;

implementation

{$R *.DFM}

Uses uSistema, fMTFinalizarEtapa, uDataBase, DBaseDados, uMensErro;

procedure TFrmMTExecEtapa.btnExecutarClick(Sender: TObject);
Var
   frm: TForm;
begin
   inherited;
   Sistema.idRad := Cds.FieldByName( 'IDPROCESSO' ).asInteger;
   // Abrir Objetos RAD
   CdsObjRad.Close;
   SqlObjRad.Prepare;
   SqlObjRad.ParamByName( 'pIDTPPROC' ).AsInteger  := Cds.FieldByName( 'IDTIPOPROCESSO' ).asInteger;
   SqlObjRad.ParamByName( 'pIDTPETAPA' ).AsInteger := Cds.FieldByName( 'IDTIPOETAPA' ).asInteger;
   SqlObjRad.ParamByName( 'pIDMODULO' ).AsInteger  := Sistema.IdModulo;
   SqlObjRad.Open;

   If CdsObjRad.IsEmpty Then Begin
      FinalizaEtapa;
   End Else Begin
      CdsObjRad.First;

      While not CdsObjRad.EOF Do Begin
            AbreItemMenu( CdsObjRad.FieldByName( 'NOMEOBJETO' ).AsString );

            Application.ProcessMessages;
            frm := Screen.ActiveForm;

            While frm.Showing do
                  Application.ProcessMessages;

            CdsObjRad.Next;
      End;

      FinalizaEtapa;
   End;

   Sistema.idRad := 0;
   BtnExecutar.Enabled := ( Not Cds.IsEmpty );
end;

Procedure TFrmMTExecEtapa.FinalizaEtapa;
Begin
  Application.CreateForm( TFrmMTFinalizarEtapa, FrmMTFinalizarEtapa );
  FrmMTFinalizarEtapa.CdsEtapa.Close;
  FrmMTFinalizarEtapa.SqlEtapa.Prepare;
  FrmMTFinalizarEtapa.SqlEtapa.ParamByName( 'pIDPROC' ).AsInteger  := Cds.FieldByName( 'IDPROCESSO' ).asInteger;
  FrmMTFinalizarEtapa.SqlEtapa.ParamByName( 'pIDETAPA' ).AsInteger := Cds.FieldByName( 'IDETAPA' ).asInteger;
  FrmMTFinalizarEtapa.SqlEtapa.Open;
  
  FrmMTFinalizarEtapa.iIdTipoProc    := Cds.FieldByName( 'IDTIPOPROCESSO' ).asInteger;
  FrmMTFinalizarEtapa.iIdProc        := Cds.FieldByName( 'IDPROCESSO' ).asInteger;
  FrmMTFinalizarEtapa.iIdEtapa       := Cds.FieldByName( 'IDETAPA' ).asInteger;
  FrmMTFinalizarEtapa.MemObs.Text    := Cds.FieldByName( 'OBS' ).asString;
  FrmMTFinalizarEtapa.lbProc.Caption := Cds.FieldByName( 'NOMEPROC' ).asString;
  FrmMTFinalizarEtapa.sPessoa        := Cds.FieldByName( 'RAZAOSOCIAL' ).asString;
  FrmMTFinalizarEtapa.sDoc           := Cds.FieldByName( 'NUMDOCUMENTO' ).asString;
  FrmMTFinalizarEtapa.sUsuario       := Cds.FieldByName( 'NOMEUSUARIO' ).asString;

  FrmMTFinalizarEtapa.ShowModal;
  FrmMTFinalizarEtapa.Free;
  
  If cbAtualiza.Checked Then
     MostraEtapasPend( False )
  Else
     Cds.Delete;

  If dbgrdDet.CanFocus Then
     dbgrdDet.SetFocus;
End;

{ Alex 17.06.05
function TFrmMTExecEtapa.FazVerificaUsu( tTVerificaUsu: TVerificaUsu ): Boolean;
var
  sSql: string;
Begin
   Result := True;
   //Verifica se o usuario já autorizou
   CdsJaAutorizou.Close;
   SqlJaAutorizou.Prepare;
   SqlJaAutorizou.ParamByName( 'pIDETAPA' ).AsInteger    := tTVerificaUsu.idEtapa;
   SqlJaAutorizou.ParamByName( 'pIDPROCESSO' ).AsInteger := tTVerificaUsu.idProcesso;
   SqlJaAutorizou.ParamByName( 'pIDUSUARIO' ).AsInteger  := Sistema.IdUsuario;
   SqlJaAutorizou.Open;


   If Not CdsJaAutorizou.IsEmpty Then Begin
      Result := False;
      Exit;
   End;

   //Verifica se o usuario pode autorizar
   // Alex 17.06.2005 salvar o sql antes de mudá-lo  -- provavelmente este sql será retirado.
   sSql :=  SqlVerifUsuario.SQL.Text;
   CdsVerifUsuario.Close;
   // esta verificação já está sendo feita pelo select do montaselect


   If tTVerificaUsu.codCentroCusto <> '' Then Begin
      SqlVerifUsuario.SQL.Add('   AND ( ( RTRIM( AUT.CODCENTROCUSTO ) = SUBSTR(' + QuotedStr( tTVerificaUsu.codCentroCusto ) + ', 1, LENGTH( RTRIM( AUT.CODCENTROCUSTO ) ) ) ) OR ( AUT.CODCENTROCUSTO IS NULL ) ) ');
      SqlVerifUsuario.SQL.Add('   AND ( ( AUT.IDEMPRESA = ' + IntToStr( tTVerificaUsu.idEmpresa ) + ' ) OR ( AUT.IDEMPRESA IS NULL ) ) ');
   end;

   if tTVerificaUsu.codCentroRespon <> '' Then Begin
      SqlVerifUsuario.SQL.Add('   AND ( ( RTRIM( AUT.CODCENTRORESPON ) = SUBSTR(' + QuotedStr( tTVerificaUsu.codCentroRespon ) + ', 1, LENGTH( RTRIM( AUT.CODCENTRORESPON ) ) ) ) OR ( AUT.CODCENTRORESPON IS NULL ) ) ');
      SqlVerifUsuario.SQL.Add('   AND ( ( AUT.IDPESSOA = ' + IntToStr( tTVerificaUsu.idPessoa ) + ' ) OR ( AUT.IDPESSOA IS NULL ) ) ');
   end;

   if tTVerificaUsu.codGrupoProd <> '' Then Begin
      SqlVerifUsuario.SQL.Add('   AND ( ( RTRIM( AUT.CODGRUPOPROD ) = SUBSTR(' + QuotedStr( tTVerificaUsu.codGrupoProd ) + ', 1, LENGTH( RTRIM( AUT.CODGRUPOPROD ) ) ) ) OR ( AUT.CODGRUPOPROD IS NULL ) ) ');
   end;

   if  tTVerificaUsu.unidNegoc <> 0 Then Begin
      SqlVerifUsuario.SQL.Add('   AND ( ( AUT.UNIDNEGOC = ' + IntToStr( tTVerificaUsu.unidNegoc ) + ' ) OR ( AUT.UNIDNEGOC IS NULL ) ) ');
      SqlVerifUsuario.SQL.Add('   AND ( ( AUT.IDPESSOA = ' + IntToStr( tTVerificaUsu.idPessoa ) + ' ) OR ( AUT.IDPESSOA IS NULL ) ) ');
   end;

   if tTVerificaUsu.VlrProc  <> 0  Then Begin
      SqlVerifUsuario.SQL.Add('   AND ( ( VLR.VLRINICIAL <= ' + FloatToStrCM( tTVerificaUsu.VlrProc ) + ' ) OR ( VLR.VLRINICIAL = 0 ) OR ( VLR.VLRINICIAL IS NULL ) ) ');
      SqlVerifUsuario.SQL.Add('   AND ( ( VLR.VLRFINAL >= ' + FloatToStrCM( tTVerificaUsu.VlrProc ) + ' ) OR ( VLR.VLRFINAL = 0 ) OR ( VLR.VLRFINAL IS NULL ) ) ');
   end;

   // início - andre tavares - pendência 17624 - 16/11/2004
   if tTVerificaUsu.codTipDoc <> 0 then
   begin
     SqlVerifUsuario.SQL.Add(' AND ((AUT.CODTIPDOC = ' + formatFloat('0', tTVerificaUsu.codTipDoc) + ') OR (AUT.CODTIPDOC IS NULL) )');
   end;
   // fim - andre tavares - pendência 17624 - 16/11/2004

   SqlVerifUsuario.Prepare;
   SqlVerifUsuario.ParambyName( 'pIDUSU' ).AsInteger          := Sistema.IdUsuario;
   SqlVerifUsuario.ParambyName( 'pIDTIPOPROCESSO' ).AsInteger := tTVerificaUsu.idTipoProcesso;
   SqlVerifUsuario.ParambyName( 'pIDTIPOETAPA' ).AsInteger    := tTVerificaUsu.idTipoEtapa;
   SqlVerifUsuario.Open;

   // Alex 17.06.2005  -- restaura o sql original
   SqlVerifUsuario.SQL.Text := sSql;

   If CdsVerifUsuario.IsEmpty Then Begin
      Result := False;
      Exit;
   End;


   //Verifica se todo mundo do grupo de usuarios deste usuario já autorizou
   CdsVerifUsuario.First;
   SqlVerifAutGrupo.Prepare;

   While Not CdsVerifUsuario.EOF Do Begin
         CdsVerifAutGrupo.Close;
         SqlVerifAutGrupo.ParamByName( 'pIDPROCESSO' ).AsInteger      := tTVerificaUsu.idProcesso;
         SqlVerifAutGrupo.ParamByName( 'pIDETAPA' ).AsInteger         := tTVerificaUsu.idEtapa;
         SqlVerifAutGrupo.ParamByName( 'pIDTIPOETAPA' ).AsInteger     := tTVerificaUsu.idTipoEtapa;
         SqlVerifAutGrupo.ParamByName( 'pIDTIPOPROCESSO' ).AsInteger  := tTVerificaUsu.idTipoProcesso;
         SqlVerifAutGrupo.ParamByName( 'pIDGRUPOAUTORIZA' ).AsInteger := CdsVerifUsuario.FieldByName( 'IDGRUPOAUTORIZA' ).AsInteger;
         SqlVerifAutGrupo.ParamByName( 'pIDGRPRESPON' ).AsInteger     := CdsVerifUsuario.FieldByName( 'IDGRPRESPON' ).AsInteger;
         SqlVerifAutGrupo.Open;



         If Not CdsVerifAutGrupo.isEmpty Then Begin
            If CdsVerifAutGrupo.FieldByName( 'NUMAUTGRUPO' ).AsInteger >= CdsVerifUsuario.FieldByName( 'NUMAUTORIZACAO' ).AsInteger Then Begin
               Result := False;
               Exit;
            End;
         End;

         //------------------------------------------------------------------------------------------
         // Verifica se Todos os usuarios do grupo anterior já autorizaram
         //------------------------------------------------------------------------------------------
         CdsVerifSeq.Close;
         SqlVerifSeq.Prepare;
         SqlVerifSeq.ParamByName( 'pIDGRUPOAUTORIZA' ).AsInteger := CdsVerifUsuario.FieldByName( 'IDGRUPOAUTORIZA' ).AsInteger;
         SqlVerifSeq.ParamByName( 'pSEQAUTORIZACAO' ).AsInteger  := CdsVerifUsuario.FieldByName( 'SEQAUTORIZACAO' ).AsInteger -1;
         SqlVerifSeq.Open;

         If Not CdsVerifSeq.isEmpty Then Begin
            CdsVerifAutGrupo.Close;
            SqlVerifAutGrupo.ParamByName( 'pIDPROCESSO' ).AsInteger      := tTVerificaUsu.idProcesso;
            SqlVerifAutGrupo.ParamByName( 'pIDETAPA' ).AsInteger         := tTVerificaUsu.idEtapa;
            SqlVerifAutGrupo.ParamByName( 'pIDTIPOETAPA' ).AsInteger     := tTVerificaUsu.idTipoEtapa;
            SqlVerifAutGrupo.ParamByName( 'pIDTIPOPROCESSO' ).AsInteger  := tTVerificaUsu.idTipoProcesso;
            SqlVerifAutGrupo.ParamByName( 'pIDGRUPOAUTORIZA' ).AsInteger := CdsVerifUsuario.FieldByName( 'IDGRUPOAUTORIZA' ).AsInteger;
            SqlVerifAutGrupo.ParamByName( 'pIDGRPRESPON' ).AsInteger     := CdsVerifSeq.FieldByName( 'IDGRPRESPON' ).AsInteger;
            SqlVerifAutGrupo.Open;

            If Not CdsVerifAutGrupo.isEmpty Then Begin
               If CdsVerifAutGrupo.FieldByName( 'NUMAUTGRUPO' ).AsInteger < CdsVerifSeq.FieldByName( 'NUMAUTORIZACAO' ).AsInteger Then Begin
                  Result := False;
                  Exit;
               End;
            end;
         end;

         CdsVerifUsuario.Next;
   End;
end;
}

procedure TFrmMTExecEtapa.MostraEtapasPend( bPendentes: Boolean );
var
  sSql: String;
Begin
  bExecutar := Not bPendentes;
  btnExecutar.Visible := bExecutar;

  If bPendentes Then
     FrmMTExecEtapa.Caption := 'RAD - Consulta Etapas Pendentes'
  Else
     FrmMTExecEtapa.Caption := 'RAD - Execução de Etapas';

  MsEp.Filtro.Add( 'RADTIPOETAPAXPROC.IDMODULO = ' + FloatToStr( Sistema.IdModulo ) );
// início - andre tavares - 22/11/2004 - pendência 17624
{
  sSql := '( SELECT DISTINCT EXA.IDTIPOPROCESSO, EXA.IDTIPOETAPA ' +
              'FROM RADETAPAXGRPRESP EXA, RADGRUPOAUTORIZA A, ' +
                   'RADGRPRESPON G, RADGRAUTXGRRESPON AXG, RADRESPONXGRP RXP ' +
             'WHERE ( EXA.IDGRUPOAUTORIZA = A.IDGRUPOAUTORIZA ) ' +
               'AND ( G.IDGRPRESPON = AXG.IDGRPRESPON ) ' +
               'AND ( AXG.IDGRUPOAUTORIZA = EXA.IDGRUPOAUTORIZA ) ' +
               'AND ( G.IDGRPRESPON = RXP.IDGRPRESPON ) ' +
               'AND ( RXP.IDUSUARIO = ' + FloatToStr( Sistema.IdUsuario ) + ' ) ) USU ';

  MsEp.Tabelas.Add( sSql );

  MsEp.Filtro.Add( 'USU.IDTIPOPROCESSO = RADTIPOPROCESSO.IDTIPOPROCESSO' );
  MsEp.Filtro.Add( 'USU.IDTIPOETAPA = RADTIPOETAPA.IDTIPOETAPA' );
  MsEp.Filtro.Add( 'RADRESPONXGRP.IDUSUARIO = ' + FloatToStr( Sistema.IdUsuario )); // andre tavares
}

  MsEp.Filtro.Add('RADRESPONXGRP.IDUSUARIO = ' + FloatToStr( Sistema.IdUsuario ));
// fim - andre tavares - 22/11/2004 - pendência 17624



  //MsEp.Filtro.Add( 'RADINSTPROCESSO.IDUSUARIO = ' + FloatToStr( Sistema.IdUsuario ) );

  BtnProcurarClick( Self );

  If Cds.isEmpty Then Begin
     Cds.Close;
     MsgDlg( 'Nenhuma das Etapas selecionadas está disponível.', 'RAD', MtInformation, [MbOk], 0 );
     bbtnSair.Click;
  End;
end;

procedure TFrmMTExecEtapa.FormActivate(Sender: TObject);
begin
  inherited;
  If dbgrdDet.CanFocus Then
     dbgrdDet.SetFocus;
end;

procedure TFrmMTExecEtapa.BtnProcurarClick(Sender: TObject);
begin
  inherited;
  If MsEp.Executar <> MrOk Then
     Exit;

  sIdEtapas := MsEp.ValoresChave[ 0 ];

  While MsEp.GetNextSelected Do
        sIdEtapas := sIdEtapas + ',' + MsEp.ValoresChave[ 0 ];

  Cds.DisableControls;
  Cds.Close;
  // Alex 17.06.05 Sql.Prepare;

  If bExecutar Then
     // Alex 17.06.05 Sql.ParambyName( 'pIDMODULO' ).AsInteger := Sistema.IdModulo
     Cds.Data := CtrlEtapa.ListaProcessosPendentes( Sistema.IdUsuario, sIdEtapas, Sistema.IdModulo)
  Else
     // Alex 17.06.05 Sql.ParamByName( 'pIDMODULO' ).ClearLine;
     Cds.Data := CtrlEtapa.ListaProcessosPendentes( Sistema.IdUsuario, sIdEtapas, -1);

  // Alex 17.06.05 Sql.ParambyName( 'pIDUSUARIO' ).AsInteger := Sistema.IdUsuario;
  // Alex 17.06.05 Sql.Open;
  Cds.First;

  // Alex 16.06.2005, este código foi colocado com redundância no médodo do monta select.afteropen
  // para mostrar no resultado do monta select apenas processos que o usuário efetivamente precisa
  // autorizar
  // Alex 17.06.05 Cds.Data := VerificaUsuario (cds.Data, TFClientDataSet);
  Cds.Data := CtrlEtapa.VerificaUsuario (Sistema.IdUsuario, Cds.Data {Alex 23/06/05 , TFClientDataSet});

{  While Not Cds.Eof Do Begin
        If Not FazVerificaUsu( RetornaTipoVerificaUsu(cds, TFClientDataSet) ) then
                               //Cds.FieldByName( 'IDTIPOPROCESSO' ).AsInteger,
                               //Cds.FieldByName( 'IDTIPOETAPA' ).AsInteger ) Then
           Cds.Delete
        Else
           Cds.Next;
  End;
}
  Cds.First;
  Cds.EnableControls;
  BtnExecutar.Enabled := ( Not Cds.IsEmpty );
end;

procedure TFrmMTExecEtapa.Sql_lixoFormartParam(sParamName, sOldValue: String;
  var sNewValue: String);
begin
  inherited;
  If UpperCase( sParamName ) = 'IDETAPA' Then
     sNewValue := sIdEtapas;
end;

procedure TFrmMTExecEtapa.MsEpAfterOpenCds(oCds: TClientDataSet);
begin
  inherited;
  // Alex 16.06.2005 metodo criado para excluir registros de usuários que ainda não podem
  // autorizar algum processo
  oCds.First;
  oCds.Data := CtrlEtapa.VerificaUsuario (Sistema.IdUsuario, oCds.Data { Alex 23/06/05 , TFMontaSelect});

end;

{ Alex 17.06.05
function TFrmMTExecEtapa.RetornaTipoVerificaUsu(_CdsLocal: TClientDataSet;
  sTipo: TMSCds): TVerificaUsu;
begin

  case sTipo of
     TFClientDataSet: begin
       result.idTipoProcesso  := _CdsLocal.FieldByName( 'IDTIPOPROCESSO' ).AsInteger;
       result.idTipoEtapa     := _CdsLocal.FieldByName( 'IDTIPOETAPA' ).AsInteger;
       result.idEtapa         := _CdsLocal.FieldByName( 'IDETAPA' ).AsInteger;
       result.idProcesso      := _CdsLocal.FieldByName( 'IDPROCESSO' ).AsInteger;
       result.codCentroCusto  := _CdsLocal.FieldByName( 'CODCENTROCUSTO' ).AsString;
       result.idEmpresa       := _CdsLocal.FieldByName( 'IDEMPRESA' ).AsInteger;
       result.codCentroRespon := _CdsLocal.FieldByName( 'CODCENTRORESPON' ).AsString;
       result.idPessoa        := _CdsLocal.FieldByName( 'IDPESSOA' ).AsInteger;
       result.codGrupoProd    := _CdsLocal.FieldByName( 'CODGRUPOPROD' ).AsString;
       result.unidNegoc       := _CdsLocal.FieldByName( 'UNIDNEGOC' ).AsInteger;
       result.VlrProc         := _CdsLocal.FieldByName( 'VLRPROC' ).AsFloat;
       result.codTipDoc       := _CdsLocal.FieldByName( 'CODTIPDOC' ).asInteger;
     end;
     TFMontaSelect: begin
       // estes índices foram retirados da query do monta select, caso o mesmo seja alterado
       // é primordial que os índices sejam modificados também
       result.idTipoProcesso  := _CdsLocal.Fields[8].AsInteger;    //   RADINSTPROCESSO.IDTIPOPROCESSO AS C8,
       result.idTipoEtapa     := _CdsLocal.Fields[9].AsInteger;    //   RADINSTETAPA.IDTIPOETAPA AS C9,
       result.idEtapa         := _CdsLocal.Fields[5].AsInteger;    //   RADINSTETAPA.IDETAPA AS C5,
       result.idProcesso      := _CdsLocal.Fields[0].AsInteger;    //   RADINSTPROCESSO.IDPROCESSO AS C0,
       result.codCentroCusto  := _CdsLocal.Fields[17].AsString;    //   RADINSTPROCESSO.CODCENTROCUSTO AS C17,
       result.idEmpresa       := _CdsLocal.Fields[20].AsInteger;   //   RADINSTPROCESSO.IDEMPRESA AS C20,
       result.codCentroRespon := _CdsLocal.Fields[18].AsString;    //   RADINSTPROCESSO.CODCENTRORESPON AS C18,
       result.idPessoa        := _CdsLocal.Fields[19].AsInteger;   //   RADINSTPROCESSO.IDPESSOA AS C19,
       result.codGrupoProd    := _CdsLocal.Fields[22].AsString;    //   RADINSTPROCESSO.CODGRUPOPROD AS C22,
       result.unidNegoc       := _CdsLocal.Fields[21].AsInteger;   //   RADINSTPROCESSO.UNIDNEGOC AS C21,
       result.VlrProc         := _CdsLocal.Fields[14].AsFloat;     //   RADINSTPROCESSO.VLRPROC AS C14,
       result.codTipDoc       := _CdsLocal.Fields[23].AsInteger;   //   RADINSTPROCESSO.CODTIPDOC AS C23
     end;
  end;

end;

function TFrmMTExecEtapa.VerificaUsuario(const oCdsLocal: OleVariant; const sTipo: TMSCds): OleVariant;
var
  _CdsLocal : TClientDataSet;
begin
  try
    _CdsLocal := TClientDataSet.Create(nil) ;
    _CdsLocal.Data := oCdsLocal;
    _CdsLocal.First;
    while not _CdsLocal.Eof do begin
      if not FazVerificaUsu ( RetornaTipoVerificaUsu ( _CdsLocal, sTipo ) ) then
         _CdsLocal.Delete
      else
         _CdsLocal.Next;
    end;
  finally
    result := _CdsLocal.data;
    FreeAndNil (_CdsLocal)
  end;
end;

}

procedure TFrmMTExecEtapa.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlEtapa := TCtrlEtapa.Create;
  CtrlEtapa.InitializeAs (Padroes)
end;

procedure TFrmMTExecEtapa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CtrlEtapa.free;
  inherited;
end;

end.




// ANDRE TAVARES - QUERY ANTIGA DO sql -> cDS
SELECT IP.IDPROCESSO,
       IP.DATAINIPROCESSO,
       IP.DATAFIMPREV AS DATAFIMPROC,
       IE.DATAFIMPREV AS DATAFIMETAPA,
       IP.IDTIPOPROCESSO,
       TP.NOME AS NOMEPROC,
       IP.OBS,
       IE.DATAINIETAPA,
       TE.NOME AS NOMEETAPA,
       IE.IDETAPA,
       TEP.IDMODULO,
       IP.CODCENTROCUSTO,
       IP.IDEMPRESA,
       IP.UNIDNEGOC,
       IP.IDPESSOA,
       IP.CODGRUPOPROD,
       IP.CODCENTRORESPON,
       IP.VLRPROC,
       IP.IDPESSRESP,
       IP.CODTIPDOC,
       IE.IDTIPOETAPA,
       P.RAZAOSOCIAL,
       P.NUMDOCUMENTO,
       M.NOMEMODULO,
       U.NOMEUSUARIO
  FROM PESSOA P,
       RADINSTPROCESSO IP,
       RADINSTETAPA IE,
       RADTIPOPROCESSO TP,
       RADTIPOETAPA TE,
       RADTIPOETAPAXPROC TEP,
       MODULO M,
       USUARIOSISTEMA U,
       ( SELECT DISTINCT
                EXA.IDTIPOPROCESSO,
                EXA.IDTIPOETAPA
           FROM RADETAPAXGRPRESP EXA,
                RADGRUPOAUTORIZA A,
                RADGRPRESPON G,
                RADGRAUTXGRRESPON AXG,
                RADRESPONXGRP RXP
          WHERE ( EXA.IDGRUPOAUTORIZA = A.IDGRUPOAUTORIZA )
            AND ( G.IDGRPRESPON       = AXG.IDGRPRESPON )
            AND ( AXG.IDGRUPOAUTORIZA = EXA.IDGRUPOAUTORIZA )
            AND ( G.IDGRPRESPON       = RXP.IDGRPRESPON )
            AND ( RXP.IDUSUARIO       = :pIDUSUARIO ) ) USU
 WHERE ( IP.FLGOK = 'N' )
   AND ( TEP.IDMODULO = :pIDMODULO )
   AND ( IE.IDETAPA IN ( :IDETAPA ) )
   AND ( IE.DATAFIMETAPA IS NULL )
   AND ( USU.IDTIPOPROCESSO = TP.IDTIPOPROCESSO )
   AND ( USU.IDTIPOETAPA = TE.IDTIPOETAPA )
   AND ( IP.IDPROCESSO = IE.IDPROCESSO )
   AND ( IP.IDTIPOPROCESSO = TP.IDTIPOPROCESSO )
   AND ( IE.IDTIPOETAPA = TE.IDTIPOETAPA )
   AND ( TEP.IDTIPOPROCESSO = TP.IDTIPOPROCESSO )
   AND ( TEP.IDTIPOETAPA = TE.IDTIPOETAPA )
   AND ( TEP.IDMODULO = M.IDMODULO )
   AND ( IP.IDUSUARIO = U.IDUSUARIO(+) )
   AND ( IP.IDPESSRESP = P.IDPESSOA(+) )
 ORDER BY IP.IDPROCESSO

