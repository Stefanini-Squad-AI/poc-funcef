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
unit fEnviaMensHospede;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  CMProcura, Buttons, Mask, wwdbedit, StdCtrls, TB97Ctls,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, TB97Tlbr, TB97, ExtCtrls, wwdblook,
  Db, DBTables, wwQuery, Wwdotdot, Wwdbcomb, Grids, Wwdbigrd,
  Wwdbgrid, Wwdatsrc, Wwdbdlg, CMDBLookupCombo, ComCtrls,
  fMensagem, CmDock, uCmSqlParams, DBClient;

type
  TfrmEnviaMensHospede = class(TfrmMensagem)
    edDestinatario: TEdit;
    Label1: TLabel;
    Panel3: TPanel;
    memAssunto: TMemo;
    wwDBGrid1: TwwDBGrid;
    Label2: TLabel;
    dsAssunto: TwwDataSource;
    CdsAssunto: TClientDataSet;
    CspAssunto: TCMSqlParams;
    procedure FormCreate(Sender: TObject);
    procedure dsAssuntoDataChange(Sender: TObject; Field: TField);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEnviaMensHospede: TfrmEnviaMensHospede;

implementation

uses uDataBase;

{$R *.DFM}

procedure TfrmEnviaMensHospede.FormCreate(Sender: TObject);
begin
  inherited;
  CspAssunto.Open;
  eddestinatario.Text := TRIM(CdsDestinatario.FieldByName('SOBRENOME').AsString)+', '+
                         TRIM(CdsDestinatario.FieldByName('NOME').AsString);
end;

procedure TfrmEnviaMensHospede.dsAssuntoDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  memAssunto.Text := CdsAssunto.fieldbyName('MENSAGEM').AsString;
end;

end.
