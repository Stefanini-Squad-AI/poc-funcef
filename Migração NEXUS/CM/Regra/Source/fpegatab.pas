unit Fpegatab;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ToolWin, ComCtrls, ExtCtrls, StdCtrls, Buttons, wwdblook, Db, DBTables,
  Wwquery, Wwdatsrc {, TB97Tlbr, TB97};

type
  Tfrmpegatab = class(TForm)
    painel1: TPanel;
    QrypegaTabBio: TwwQuery;
    QrypegaHipotese: TwwQuery;
    DBpegaHipotese: TwwDBLookupCombo;
    DBpegaTabBio: TwwDBLookupCombo;
    textotabela: TLabel;
    painelgrphip: TPanel;
    wwDBPegaGrphip: TwwDBLookupCombo;
    QryPegaGrpHip: TwwQuery;
    Label1: TLabel;
    bbtnConfirmar: TBitBtn;
    procedure bbtnSairClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmpegatab: Tfrmpegatab;

implementation
uses uregra;
{$R *.DFM}

procedure Tfrmpegatab.bbtnSairClick(Sender: TObject);
begin
    close;
end;

procedure Tfrmpegatab.SpeedButton1Click(Sender: TObject);
begin
    showmessage('1-  Atribuir valor/fórmula à variável' +#13+#10+
                '2-  Atribuir valor/fórmula à campo' +#13+#10+
                '3-  Comparar variavel com valor/fórmula' +#13+#10+
                '4-  Comparar campo com valor/fórmula' +#13+#10+
                '5-  Comparar variável com variável' +#13+#10+
                '6-  Comparar variável com campo' +#13+#10+
                '7-  Comparar campo com variável' +#13+#10+
                '8-  Comparar campo com campo' +#13+#10+
                '9-  Parar' +#13+#10+
                '10- Input de Valor em uma Variável' +#13+#10+
                '11- Atribuir variável/campo à variável/campo' +#13+#10+
                '12- Sair da regra' +#13+#10+
                '13- Exibe mensagem' +#13+#10+
                '14- Atribuir resultado de regra à variável' +#13+#10+
                '15- Ir para um determinado passo');
end;

procedure Tfrmpegatab.bbtnConfirmarClick(Sender: TObject);
begin
    close;
end;

procedure Tfrmpegatab.bbtnCancelarClick(Sender: TObject);
begin
    sairdaregra:=true;
    
end;

end.
