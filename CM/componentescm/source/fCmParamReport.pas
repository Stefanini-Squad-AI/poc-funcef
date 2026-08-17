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
unit fCmParamReport;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  TB97, CmDock, ExtCtrls, IvDictio, IvMulti, IvEMulti, StdCtrls;

type
  TFrmCmParamReport = class(TForm)
    CMOkCancelar1: TCMOkCancelar;
    PnlFundo: TPanel;
    SbFundo: TScrollBox;
    ivTradutor: TIvExtendedTranslator;
    procedure CMOkCancelar1CancelarClick(Sender: TObject);
    procedure CMOkCancelar1OkClick(Sender: TObject);
    procedure CMOkCancelar1SairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;




implementation


{$R *.DFM}

procedure TFrmCmParamReport.CMOkCancelar1CancelarClick(Sender: TObject);
begin
  ModalResult := Mrcancel;
end;




procedure TFrmCmParamReport.CMOkCancelar1OkClick(Sender: TObject);
begin
  ModalResult := MrOk;
end;




procedure TFrmCmParamReport.CMOkCancelar1SairClick(Sender: TObject);
begin
  ModalResult := MrIgnore;
end;


end.
