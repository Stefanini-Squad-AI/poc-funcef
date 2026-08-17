unit fPrincipal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, uSistema;

type
  TFrmPrincipal = class(TForm)
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    sMens: String;
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

uses RAnimal, uCmRptManager;

{$R *.DFM}

procedure TFrmPrincipal.Button1Click(Sender: TObject);
begin
  {**
    O PrintReport é um método da Classe de Relatórios que cria a instância do
    form de relatórios, exibe a tela de parâmetros e mostra o relatório.
    Os parâmetros passados são os parâmetros de ambiente do Sistema que definen
    informações do login, tipo de acesso, etc...
   **}
  TRptAnimal.PrintReport(-1,-1,1,1,1,'','','DBDEMOS','Empresa Proprietaria 1','Teste de Relatório - 02.00.00',sMens);
end;

procedure TFrmPrincipal.Button2Click(Sender: TObject);
begin
  TRptAnimal.PrintReport(-1,-1,1,1,1,'','C:\Animals.Pdf','DBDEMOS','Empresa Proprietaria 2','Teste de Relatório - 02.01.00',sMens,nil,cntBde,rdtPdf,false,false);
end;

end.
