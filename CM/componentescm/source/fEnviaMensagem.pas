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
unit fEnviaMensagem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CMProcura, Buttons, Mask, wwdbedit, StdCtrls, TB97Ctls,
  IvDictio, IvMulti, IvEMulti, TB97Tlbr, TB97, ExtCtrls, wwdblook,
  Db, DBTables, wwQuery, Wwdotdot, Wwdbcomb, Grids, Wwdbigrd,
  Wwdbgrid, Wwdatsrc, Wwdbdlg, CMDBLookupCombo, ComCtrls, uSistema,
  fMensagem, wwdbdatetimepicker, CmDock, DBClient, uCmSqlParams, ImgList,
  MontaSelect;

type
  TfrmEnviaMensagem = class(TfrmMensagem)
    Label1: TLabel;
    Label2: TLabel;                                 
    cmbDestinatario: TCMDBLookupCombo;
    edAssunto: TEdit;
    cmbGrupo: TCMDBLookupCombo;
    Label3: TLabel;
    chkProgramada: TCheckBox;
    dtProgramada: TwwDBDateTimePicker;
    CdsGrupo: TClientDataSet;
    CspGrupo: TCMSqlParams;
    ImgGrupoUsu: TImageList;
    LvMensagens: TListView;
    Bevel1: TBevel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    MsSelGrupos: TMontaSelect;
    MsSelUsu: TMontaSelect;
    procedure FormCreate(Sender: TObject);
    procedure chkProgramadaClick(Sender: TObject);
    procedure cmbDestinatarioCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure cmbGrupoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure cmbDestinatarioClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }

  end;

implementation
uses uDataBase;

{$R *.DFM}

procedure TfrmEnviaMensagem.FormCreate(Sender: TObject);
begin
  inherited;
  CspDestinatario.Open;
  CspGrupo.Open;
  cmbdestinatario.Text := CdsDestinatario.FieldByName('NOMEUSUARIO').AsString;
end;

procedure TfrmEnviaMensagem.chkProgramadaClick(Sender: TObject);
begin
  inherited;
  dtProgramada.Enabled := chkProgramada.Checked;
end;

procedure TfrmEnviaMensagem.cmbDestinatarioCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  cmbDestinatario.Text := LookupTable.FieldByName('NOMEUSUARIO').AsString;
  cmbGrupo.Text := '';
end;

procedure TfrmEnviaMensagem.cmbGrupoCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  cmbGrupo.Text := LookupTable.FieldByName('NOMEGRUPO').AsString;
  cmbDestinatario.Text := '';
end;

procedure TfrmEnviaMensagem.cmbDestinatarioClick(Sender: TObject);
begin
  inherited;
  cmbDestinatario.Text := CdsDestinatario.FieldByName('NOMEUSUARIO').AsString;
  cmbGrupo.Text := '';
end;
procedure TfrmEnviaMensagem.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  If LvMensagens.Selected <> nil then
     LvMensagens.Items.Delete(LvMensagens.Selected.Index);
end;

procedure TfrmEnviaMensagem.SpeedButton1Click(Sender: TObject);
Var
  lItem: TListItem;
begin
  inherited;
  if MsSelGrupos.Executar = mrOk then
  begin
     While MsSelGrupos.GetNextSelected do
       if (LvMensagens.FindCaption(0, MsSelGrupos.ValoresChave[1], false, true, false) = nil) And
          (MsSelGrupos.ValoresChave[1] <> cmbGrupo.Text) then
       begin
          lItem := LvMensagens.Items.Add;
          lItem.ImageIndex := 1;
          lItem.Caption := MsSelGrupos.ValoresChave[1];
          lItem.SubItems.Add(MsSelGrupos.ValoresChave[0]);
       end;
  end;
end;

procedure TfrmEnviaMensagem.SpeedButton2Click(Sender: TObject);
Var
  lItem: TListItem;
begin
  inherited;
  if MsSelUsu.Executar = mrOk then
  begin
     While MsSelUsu.GetNextSelected do
       if (LvMensagens.FindCaption(0, MsSelUsu.ValoresChave[1], false, true, false) = nil) And
          (MsSelUsu.ValoresChave[1] <>  cmbDestinatario.Text) then
       begin
          lItem := LvMensagens.Items.Add;
          lItem.ImageIndex := 0;
          lItem.Caption := MsSelUsu.ValoresChave[1];
          lItem.SubItems.Add(MsSelUsu.ValoresChave[0]);
       end;
  end;

end;

end.
