{ andre tavares - pendência 20562 - 01/11/2005 -
retirei o richedit e utilizei um memo comum para caber a query monstro }
{
Nº SOL......: 211165
Nº KINTANA..: 2031517
Data........: 09/07/2013
Responsável.: William Moreira da Silva
Descrição...: Inseria linha em branco a mais nas descrições
--------------------------------------------------------------------------------------------------
Rotina    : MontaSelect
Data      : 08/03/2004
Autor     : Marcheti
Pendencia : 15228
Descrição : Ajuste no campo descricao
---------------------------------------------------------------------------------------------------}
unit FConsultaManualMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, ComCtrls, StdCtrls, DBCtrls, Mask, wwdbedit, MontaSelect,
  Db, DBClient, uCMClientDataSet, CmEventosCadastro, ImgList, Wwdatsrc,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97Ctls, TB97,
  ExtCtrls, uCtrlDataview, uCtrlGrupoUsu
{$IFNDEF VERSAO0505}
  , uCmTypes, uCmSqlParams
{$ENDIF}
;

type
  TFrmConsultaManual = class(TFrmCadastroMT)
    BtnDDic: TToolbarButton97;
    Nome: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    DbEdNome: TwwDBEdit;
    DbMemDesc: TDBMemo;
    Label6: TLabel;
    DbEdCodigo: TwwDBEdit;
    Label7: TLabel;
    DbEdOrigem: TwwDBEdit;
    CdsDataViewAcesso: TClientDataSet;
    SQLDataViewAcesso: TCMSqlParams;
    ReSql: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnDDicClick(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure sbtnInserirClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Dataview: TCtrlDataview;
    DataviewAcesso: TCtrlGrupoUsu;
    procedure Seleciona( IdDataview: Double = 0; OrigemCmDv: Double = -1 );
  end;

var
  FrmConsultaManual: TFrmConsultaManual;
  veioInserir: boolean;//William Moreira da Silva - SOL 211165 KINTANA 2031517

implementation

Uses uMensErro, dBasedados, uSistema, uMidasUtil, uModulo, uVerificaSQL,
     FDesenhoOutLookMT;

{$R *.DFM}

procedure TFrmConsultaManual.Seleciona( IdDataview: Double = 0; OrigemCmDv: Double = -1 );
begin
  cds.Data := Dataview.ListaDataview( IdDataview, OrigemCmDv );
end;

procedure TFrmConsultaManual.FormCreate(Sender: TObject);
begin
  inherited;
  Dataview := TCtrlDataview.Create();
  Dataview.Initialize( DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
                       Sistema.ConnectionSide, Sistema.AppRemoteServer, True );
  DataviewAcesso := TCtrlGrupoUsu.Create();
  DataviewAcesso.Initialize( DtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
                             Sistema.ConnectionSide, Sistema.AppRemoteServer, True );
  Dataview.Cds := Cds;
  Seleciona( -1 );
end;

procedure TFrmConsultaManual.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Dataview.Free;
  DataviewAcesso.Free;
end;

procedure TFrmConsultaManual.BtnDDicClick(Sender: TObject);
begin
  inherited;
  FrmDesenhoOutLook.CmSql.DataDic.Executar;
  BtnDDic.Down := False;
end;

procedure TFrmConsultaManual.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  If MontaSelect.RetornouValor Then Begin
     Seleciona( StrToFloat( MontaSelect.ValoresChave[ 0 ] ), StrToFloat( MontaSelect.ValoresChave[ 1 ] ) );
     ReSql.Lines.Text := Cds.FieldByName( 'TEMPLATE').AsString;
  End;
end;

procedure TFrmConsultaManual.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := Dataview.Gravar;
  ReSql.Lines.Text := '';
end;

procedure TFrmConsultaManual.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := Dataview.Gravar;
end;

procedure TFrmConsultaManual.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  SQLDataViewAcesso.Prepare;
  SQLDataViewAcesso.ParamByName( 'pIdDataview' ).AsFloat := StrToFloat( MontaSelect.ValoresChave[ 0 ] );
  SQLDataViewAcesso.ParamByName( 'pOrigemcmdv' ).AsFloat := StrToFloat( MontaSelect.ValoresChave[ 1 ] );
  SQLDataViewAcesso.Open;

  While Not CdsDataViewAcesso.Eof Do
        CdsDataViewAcesso.Delete;

  DataviewAcesso.ProcessaGrupoUsu( CdsDataviewAcesso.Data, Null, Null, Null,
                                   Null, Null, Null, Null, Null, Null, OpVisoes );
  Accept := Dataview.Gravar;
  ReSql.Lines.Text := '';
end;

procedure TFrmConsultaManual.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  dbedNome.SetFocus;
end;

procedure TFrmConsultaManual.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  Cds.FieldByName( 'ORIGEMCMDV' ).AsInteger := 0;
  Cds.FieldByName( 'CLASSNAME' ).AsString   := 'TDvQryManual';
  ReSql.Lines.Text := '';
  dbedNome.SetFocus;
end;

procedure TFrmConsultaManual.bbtnConfirmarClick(Sender: TObject);
Var
  LstFields: TStringList;
begin
  If Cds.FieldByName( 'NAME' ).IsNull Then Begin
     MsgDlg( 'Indicar nome da consulta', 'Atenção', MtInformation, [MbOk], 0 );
     DbEdNome.SetFocus;
     Exit;
  End;

  If Pos( '''', Cds.FieldByName( 'NAME' ).AsString ) > 0 Then Begin
     MsgDlg( 'O Nome da Consulta não pode conter apostrofos ('').', 'Atenção', MtInformation, [MbOk], 0 );
     DbEdNome.SetFocus;
     Exit;
  End;

  Try
     If Not VerificaSql( ReSql.Lines ) Then Begin
        MsgDlg( 'Você não tem permissão de acesso a uma ou mais tabelas/colunas do Sql.',
                'Consulta Manual', MtInformation, [MbOk], 0 );
        Exit;
     End;

     // A rotina abaixo testa se a query esta funcionando corretamente
     DtmBaseDados.Cds.Close;
     DtmBaseDados.SQL.SQL.Text := ReSql.Lines.Text;
     LstFields := TStringList.Create;
     DtmBaseDados.Cds.GetFieldNames( LstFields );
     DtmBaseDados.Cds.Close;
  Except
     On E:Exception Do
     Begin
        MsgDlg('Consulta incorreta: ' + (#13 + #10) + E.Message, 'Atenção', MtInformation, [MbOk], 0 );
        DtmBaseDados.Cds.Close;
        LstFields.Free;
        Exit;
     End;
  End;

  LstFields.Free;
  DtmBaseDados.Cds.Close;
  Cds.FieldByName( 'TEMPLATE' ).AsString := ReSql.Lines.Text;

  inherited;
  //William Moreira da Silva - SOL 211165 KINTANA 2031517
  If MontaSelect.RetornouValor and (not veioInserir)Then Begin
     Seleciona( StrToFloat( MontaSelect.ValoresChave[ 0 ] ), StrToFloat( MontaSelect.ValoresChave[ 1 ] ) );
     ReSql.Lines.Text := Cds.FieldByName( 'TEMPLATE').AsString;
  End;
  //William Moreira da Silva - SOL 211165 KINTANA 2031517
end;

procedure TFrmConsultaManual.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  MsgDlg( Dataview.MessageInfo, 'Erro', mtError, [ mbOK ], 0 );
end;

procedure TFrmConsultaManual.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  veioInserir := true;//William Moreira da Silva - SOL 211165 KINTANA 2031517
end;

procedure TFrmConsultaManual.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  veioInserir := false;//William Moreira da Silva - SOL 211165 KINTANA 2031517
end;

end.
