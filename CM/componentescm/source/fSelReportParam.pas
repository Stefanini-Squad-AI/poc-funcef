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
unit fSelReportParam;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  TB97, CmDock, StdCtrls, fcCombo, fctreecombo, ExtCtrls, ImgList, Db,
  DBTables, wwQuery, wwdblook, CMDBLookupCombo, fcTreeView;

type
  TFrmSelReportParam = class(TForm)
    CMOkCancelar1: TCMOkCancelar;
    ImlReports: TImageList;
    pnlFundo: TPanel;
    Label1: TLabel;
    TreeReports: TfcTreeCombo;
    Qry: TwwQuery;
    CmbModulo: TCMDBLookupCombo;
    Label2: TLabel;
    QryModulo: TwwQuery;
    QryModuloIDMODULO: TFloatField;
    QryModuloNOMEMODULO: TStringField;
    procedure CMOkCancelar1OkClick(Sender: TObject);
    procedure CmbModuloCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSelReportParam: TFrmSelReportParam;

implementation

{$R *.DFM}

procedure TFrmSelReportParam.CMOkCancelar1OkClick(Sender: TObject);
begin
  If (CmbModulo.Text <> '') And
     (TreeReports.SelectedNode <> nil) And
     (TreeReports.SelectedNode.ImageIndex = 1) Then
     ModalResult := MrOk
  Else
     ModalResult := MrCancel;
end;

procedure TFrmSelReportParam.CmbModuloCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
Var
    SOldGrupo: String;
    TreeFilho, TreeGrupo: TfcTreeNode;
Begin
  If (CmbModulo.LookupValue <> '') Then
  Begin
     Qry.Close;
     Qry.Sql.Text := 'Select R.IdReports, R.OrigemCm, M.NomeModulo, R.Name, G.Descricao ' +
                     'From Reports R, Modulo M, GrupoRelatorio G ' +
                     'Where ' +
                     ' (R.IdModulo = ' + CmbModulo.LookupValue + ') And ' +
                     ' (R.IdModulo = M.IdModulo) And ' +
                     ' (R.IdGrupoRelatorio = G.IdGrupoRelatorio(+)) And ' +
                     ' (R.OrigemCmGr = G.OrigemCmGr(+)) ' +
                     'Order By M.NomeModulo, G.Descricao, R.Name';
     Qry.Open;

     sOldGrupo := '';
     TreeGrupo := nil;

     TreeReports.Items.Clear;

     While Not Qry.Eof Do
     Begin
        If SoldGrupo <> Qry.FieldByName('DESCRICAO').AsString Then
        Begin
         TreeGrupo               := TreeReports.Items.AddChild(nil,Qry.FieldByName('DESCRICAO').AsString);
         TreeGrupo.ImageIndex    := 3;
         TreeGrupo.SelectedIndex := 3;
         TreeGrupo.StringData    := Qry.FieldByName('IdReports').AsString;
         TreeGrupo.StringData2   := Qry.FieldByName('OrigemCm').AsString;
        End;

        TreeFilho                := TreeReports.Items.AddChild(TreeGrupo,Qry.FieldByName('NAME').AsString);
        TreeFilho.ImageIndex     := 1;
        TreeFilho.SelectedIndex  := 2;
        TreeFilho.StringData     := Qry.FieldByName('IdReports').AsString;
        TreeFilho.StringData2    := Qry.FieldByName('OrigemCm').AsString;

        sOldGrupo := Qry.FieldByName('DESCRICAO').AsString;
        Qry.Next;
     End;
     Qry.Close;
  End;
end;

procedure TFrmSelReportParam.FormShow(Sender: TObject);
begin
  If QryModulo.Active Then QryModulo.Close;
  QryModulo.Open;
end;

end.
