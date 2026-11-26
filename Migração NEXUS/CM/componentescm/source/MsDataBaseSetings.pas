{*******************************************************}
{                                                       }
{ Padrões de Desenvolvimento                            }
{ Copyright © 1998,2002 - CM Soluções Informática       }
{                                                       }
{ - Atualização para o padrão MT (3 Camadas)            }
{                                                       }
{ Analista Responsável: Gustavo Viegas                  }
{ Atualizado Em: 10/04/2002                             }
{                                                       }
{*******************************************************}
unit MsDataBaseSetings;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, wwQuery, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, wwdblook,
  CMDBLookupCombo, Wwdotdot, Wwdbcomb, Mask, wwdbedit, Wwdatsrc, MontaSelect,
  CmDock;

type
  TTipoAlteracao = (taPost, taCancel, taDelete);

  TFrmMsDataBaseSetings = class(Tform)
    pnlFundo: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label3: TLabel;
    EdtDescricao: TwwDBEdit;
    CmbFiltroEmpresa: TwwDBComboBox;
    CmbGrupo: TCMDBLookupCombo;
    CmSistema: TCMDBLookupCombo;
    CmFiltroModulo: TwwDBComboBox;
    Ds: TwwDataSource;
    QryTabelas: TwwQuery;
    QryTabelasIDMSTABELAS: TFloatField;
    QryTabelasNOMETABELAS: TStringField;
    QryTabelasIDMONTASELECT: TFloatField;
    UpdTabelas: TUpdateSQL;
    QryColunas: TwwQuery;
    QryColunasIDMSCOLUNAS: TFloatField;
    QryColunasIDMONTASELECT: TFloatField;
    QryColunasNOMECOLUNA: TStringField;
    QryColunasDESCCOLUNA: TStringField;
    QryColunasTIPODADO: TStringField;
    QryColunasMASCARA: TStringField;
    QryColunasFLGCHAVE: TStringField;
    QryColunasLARGURA: TFloatField;
    QryColunasSENSIVELACAIXA: TStringField;
    UpdColunas: TUpdateSQL;
    QryWhere: TwwQuery;
    QryWhereIDMSWHERE: TFloatField;
    QryWhereDESCWHERE: TStringField;
    QryWhereIDMONTASELECT: TFloatField;
    UpdWhere: TUpdateSQL;
    QrySistema: TwwQuery;
    QrySistemaNOMEMODULO: TStringField;
    QrySistemaIDMODULO: TFloatField;
    QryGrupo: TwwQuery;
    QryGrupoDESCRICAO: TStringField;
    QryGrupoIDGRUPORELATORIO: TFloatField;
    QryGrupoORIGEMCMGR: TFloatField;
    upd: TUpdateSQL;
    qry: TwwQuery;
    qryIDMONTASELECT: TFloatField;
    qryIDMODULO: TFloatField;
    qryIDGRUPO: TFloatField;
    qryNOMEMONTASELECT: TStringField;
    qryFLGDISTINCT: TStringField;
    qryCAMPOFILTROEMPRESA: TStringField;
    qryCAMPOFILTROSISTEMA: TStringField;
    qryORIGEMCM: TFloatField;
    DbSad: TDatabase;
    QrySequence: TwwQuery;
    CMOkCancelar1: TCMOkCancelar;
    PnlSalvar: TPanel;
    BtnExcluir: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnExcluirClick(Sender: TObject);
    procedure CMOkCancelar1OkClick(Sender: TObject);
    procedure CMOkCancelar1CancelarClick(Sender: TObject);
    procedure CMOkCancelar1SairClick(Sender: TObject);
  private
    { Private declarations }
    procedure HabilitaQry(Qry: Array Of TwwQuery; bOpen:Boolean);
    procedure AfetualAlteracoes(Qry: Array Of TwwQuery; pTipoAlteracao :TTipoAlteracao);
    Procedure LeMontaSelect(Ms:TMontaSelect);
    function GetSequence(sNomeTbl:String):Cardinal;
  public
    { Public declarations }
    Componente :TMontaSelect;
    IdConsulta :Integer;
  end;

var
  FrmMsDataBaseSetings: TFrmMsDataBaseSetings;

implementation

{$R *.DFM}

procedure TFrmMsDataBaseSetings.FormShow(Sender: TObject);
begin
   HabilitaQry([Qry,QryTabelas,QryColunas,QryWhere,QrySistema,QryGrupo],True);

   If Qry.IsEmpty Then
   Begin
     QrySequence.Open;
     Qry.Append;
     qryIDMONTASELECT.AsInteger := GetSequence('MONTASELECT');
   End
   Else
     Qry.Edit;

   IdConsulta := qryIDMONTASELECT.AsInteger;

   LeMontaSelect(Componente);
end;

procedure TFrmMsDataBaseSetings.HabilitaQry(Qry: Array Of TwwQuery; bOpen:Boolean);
Var
  iNumQry, X:Integer;
Begin
  iNumQry := High(Qry);
  For X:=0 To iNumQry Do
  Begin
      With Qry[x] Do
      Begin
         If bOpen Then
         Begin
           If Active Then Close;
           If ParamCount > 0 Then
              Params[0].AsInteger := Componente.Template.IdConsulta;
           Open;
         End
         Else
         Begin
           If Active Then
           Begin
              If CachedUpdates And UpdatesPending then CancelUpdates;
              Close;
           End;
         End;
      End;
  End;
End;

procedure TFrmMsDataBaseSetings.AfetualAlteracoes(Qry: Array Of TwwQuery;pTipoAlteracao :TTipoAlteracao);
Var
  iNumQry, X:Integer;
Begin
  iNumQry := High(Qry);
  For X:=0 To iNumQry Do
  Begin
     If Qry[x].Active Then
        Case pTipoAlteracao of
          taPost :
            If Qry[x].State In [DsEdit,DsInsert] Then  Qry[x].Post;
          taCancel :
            If Qry[x].State In [DsEdit,DsInsert] Then  Qry[x].Post;
          taDelete :
          Begin
             Qry[x].First;
             While Not Qry[x].Eof Do
                Qry[x].Delete;
          End;
        End;
  End;
End;

procedure TFrmMsDataBaseSetings.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  HabilitaQry([Qry,QryTabelas,QryColunas,QryWhere,QrySistema,QryGrupo],False);
  If DbSad.Connected Then DbSad.Connected := False;
end;


procedure TFrmMsDataBaseSetings.BtnExcluirClick(Sender: TObject);
begin
  If Application.MessageBox('Confirma Exclusão da Consulta','Ms DataBase Settings',Mb_YesNo + Mb_IconExclamation) = IdYes Then
  Begin
     AfetualAlteracoes([Qry,QryTabelas,QryColunas,QryWhere],taCancel);
     AfetualAlteracoes([Qry,QryTabelas,QryColunas,QryWhere],taDelete);
     DbSad.ApplyUpdates([QryTabelas,QryColunas,QryWhere,Qry]);
     ModalResult := MrOk;
     Close;
     IdConsulta := 0;
  End;
end;

function TFrmMsDataBaseSetings.GetSequence(sNomeTbl:String):Cardinal;
Begin
    QrySequence.Close;
    QrySequence.Sql.Text := 'SELECT SEQ' + sNomeTbl + '.NEXTVAL FROM DUAL';
    QrySequence.Open;
    Result := QrySequence.Fields[0].AsInteger;
    QrySequence.Close;
End;

Procedure TFrmMsDataBaseSetings.LeMontaSelect(Ms:TMontaSelect);
Var
  X:Integer;
Begin
  //Preenche das Tabelas a partir das Propriedades do MS
  With QryTabelas Do
  Begin
     If Active Then
     Begin
        If UpdatesPending Then CancelUpdates;
        Close;
     End;
     Open;
     While Not Eof Do Delete;
  End;

  With QryWhere Do
  Begin
     If Active Then
     Begin
        If UpdatesPending Then CancelUpdates;
        Close;
     End;
     Open;
     While Not Eof Do Delete;
  End;

  With QryColunas Do
  Begin
     If Active Then
     Begin
        If UpdatesPending Then CancelUpdates;
        Close;
     End;
     Open;
     While Not Eof Do Delete;
  End;

  For X:=0 To Ms.Tabelas.Count - 1 Do
  Begin
    QryTabelas.Append;
    QryTabelasIDMSTABELAS.AsFloat := GetSequence('MSTABELAS');
    QryTabelasNOMETABELAS.AsString := Ms.Tabelas[x];
    QryTabelasIDMONTASELECT.AsFloat := QryIDMONTASELECT.AsFloat;
    QryTabelas.Post;
  End;

  For X:=0 To Ms.Filtro.Count - 1 Do
  Begin
    QryWhere.Append;
    QryWhereIDMSWHERE.AsFloat := GetSequence('MSWHERE');
    QryWhereDESCWHERE.AsString := Ms.Filtro[x];
    QryWhereIDMONTASELECT.AsFloat := QryIDMONTASELECT.AsFloat;
    QryWhere.Post;
  End;

  For X:=0 To Ms.CamposChave.Count - 1 Do
  Begin
    QryColunas.Append;

    QryColunasIDMSCOLUNAS.AsFloat := GetSequence('MSCOLUNAS');
    QryColunasNOMECOLUNA.AsString := Ms.CamposChave[x];
    QryColunasIDMONTASELECT.AsFloat := QryIDMONTASELECT.AsFloat;
    QryColunasFLGCHAVE.AsString := 'S';
    QryColunasDESCCOLUNA.Clear;
    QryColunasTIPODADO.Clear;
    QryColunasMASCARA.Clear;
    QryColunasLARGURA.Clear;
    QryColunasSENSIVELACAIXA.Clear;

    QryColunas.Post;
  End;

  For X:=0 To Ms.Colunas.Count - 1 Do
  Begin
    QryColunas.Append;

    QryColunasIDMSCOLUNAS.AsFloat := GetSequence('MSCOLUNAS');
    QryColunasNOMECOLUNA.AsString := Ms.Colunas[x];
    QryColunasIDMONTASELECT.AsFloat := QryIDMONTASELECT.AsFloat;
    QryColunasFLGCHAVE.AsString := 'N';
    QryColunasDESCCOLUNA.AsString := Ms.Descricao[x];
    QryColunasTIPODADO.AsString := Ms.TipodeDado[x];
    QryColunasMASCARA.AsString := Ms.Mascaras[x];
    QryColunasLARGURA.AsString := Ms.Larguras[x];
    QryColunasSENSIVELACAIXA.AsString := Ms.SensivelACaixa[x];

    QryColunas.Post;
  End;

  CmFiltroModulo.Items.Clear;
  CmbFiltroEmpresa.Items.Clear;

  For X:=0 To Ms.CamposChave.Count - 1 Do
  Begin
     CmFiltroModulo.Items.Add(Ms.CamposChave[x]);
     CmbFiltroEmpresa.Items.Add(Ms.CamposChave[x]);
  End;
End;


procedure TFrmMsDataBaseSetings.CMOkCancelar1OkClick(Sender: TObject);
begin
  If (EdtDescricao.Text = '') Or
     (CmbGrupo.Text = '') Or
     (CmSistema.Text = '') Then
     Application.MessageBox('Faltam dados para gravação da consulta','Ms DataBase Settings',Mb_Ok + Mb_IconStop)
  Else
     If Application.MessageBox('Confirma Atualização da Consulta','Ms DataBase Settings',Mb_YesNo + Mb_IconQuestion) = IdYes Then
     Begin
        AfetualAlteracoes([Qry,QryTabelas,QryColunas,QryWhere],taPost);
        DbSad.ApplyUpdates([Qry,QryTabelas,QryColunas,QryWhere]);
        IdConsulta := qryIDMONTASELECT.AsInteger;
        ModalResult := MrOk;
        Close;
     End;
end;

procedure TFrmMsDataBaseSetings.CMOkCancelar1CancelarClick(
  Sender: TObject);
begin
  AfetualAlteracoes([Qry,QryTabelas,QryColunas,QryWhere],taCancel);
  ModalResult := MrCancel;
  Close;
end;

procedure TFrmMsDataBaseSetings.CMOkCancelar1SairClick(Sender: TObject);
begin
  Close;
end;

end.
