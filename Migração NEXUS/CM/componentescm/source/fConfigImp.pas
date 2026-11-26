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
unit fConfigImp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, DBCtrls, Db, DBTables, uCmRegister, uProcuraDir, ExtCtrls,
  TB97Tlbr, TB97, BfDialogs, BrowseFolder, wwdblook, 
  CmDock, DBClient, uCmSqlParams;
type
  TFrmConfigImp = class(TForm)
    DlgDir: TProcuraDirDlg;
    pnlFundo: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    SpeedButton1: TSpeedButton;
    EdtImpressora: TEdit;
    LckModelo: TwwDBLookupCombo;
    CMOCancelar: TCMOkCancelar;
    Csp: TCMSqlParams;
    Cds: TClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure CMOCancelarOkClick(Sender: TObject);
    procedure CMOCancelarCancelarClick(Sender: TObject);
    procedure CMOCancelarSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    sIdImpressora, sNomeImpressora: String;
  end;

var
  FrmConfigImp: TFrmConfigImp;

implementation

Uses uGimp;

{$R *.DFM}


procedure TFrmConfigImp.FormCreate(Sender: TObject);
begin
  CmRegister := TCmRegister.Create;
  sIdImpressora   := CmRegister.LerStringReg(HKEY_CURRENT_USER,'Software\CM\Impressora Genérica', TGimp(Owner).RegConfigImpressora.ValueNameId,'');
  sNomeImpressora := CmRegister.LerStringReg(HKEY_CURRENT_USER,'Software\CM\Impressora Genérica', TGimp(Owner).RegConfigImpressora.ValueNamePrinter,'');

  If sIdImpressora <> '' Then
     LckModelo.Lookupvalue := sIdImpressora;

  If sNomeImpressora <> '' Then
     EdtImpressora.Text := sNomeImpressora;
end;

procedure TFrmConfigImp.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Cds.Close;
  CmRegister.Free;
end;

procedure TFrmConfigImp.FormShow(Sender: TObject);
begin
  Csp.Open;
  
  If sIdImpressora <> '' Then
  Begin
     Cds.Locate('IDIMPRESSORA',sIdImpressora,[]);
     LckModelo.Text := Cds.FieldByName('DESCRICAO').AsString;
     LckModelo.LookupValue := sIdImpressora;
     LckModelo.RefreshDisplay;
     LckModelo.Text := Cds.FieldByName('DESCRICAO').AsString;          
  End;

end;

procedure TFrmConfigImp.SpeedButton1Click(Sender: TObject);
begin
  If DlgDir.Execute Then
      EdtImpressora.Text := DlgDir.Directory; 
end;

procedure TFrmConfigImp.CMOCancelarOkClick(Sender: TObject);
begin
  If (Trim(LckModelo.Text) <> '') And (trim(EdtImpressora.Text)<>'') Then
  Begin
     CmRegister.EscreverStringReg(HKEY_CURRENT_USER,'Software\CM\Impressora Genérica', TGimp(Owner).RegConfigImpressora.ValueNameId,LckModelo.LookupValue);
     CmRegister.EscreverStringReg(HKEY_CURRENT_USER,'Software\CM\Impressora Genérica', TGimp(Owner).RegConfigImpressora.ValueNamePrinter,EdtImpressora.Text);
     sIdImpressora   := LckModelo.LookupValue;
     sNomeImpressora := EdtImpressora.Text;
     Modalresult := MrOk;
  End
  Else
    Modalresult := Mrcancel;
end;

procedure TFrmConfigImp.CMOCancelarCancelarClick(Sender: TObject);
begin
  Modalresult := Mrcancel
end;

procedure TFrmConfigImp.CMOCancelarSairClick(Sender: TObject);
begin
  Modalresult := Mrcancel
end;

end.
