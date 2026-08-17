unit UCriaEstrutura;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, checklst, ExtCtrls, uMensErro;

type
  TFrmCriaEstrutura = class(TForm)
    nomecampo: TEdit;
    descricao: TListBox;
    Binclui: TButton;
    tipo: TListBox;
    Label1: TLabel;
    Label2: TLabel;
    Ptamanho: TPanel;
    PDecimal: TPanel;
    Utamanho: TUpDown;
    tamanho: TEdit;
    Label3: TLabel;
    decimal: TEdit;
    Udecimal: TUpDown;
    Label4: TLabel;
    Bexclui: TButton;
    Bsaida: TButton;
    Pbotoes: TPanel;
    BOk: TButton;
    BCancela: TButton;
    BMeio: TButton;
    Button1: TButton;
    procedure BincluiClick(Sender: TObject);
    procedure BsaidaClick(Sender: TObject);
    procedure nomecampoExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BexcluiClick(Sender: TObject);
    procedure BOkClick(Sender: TObject);
    procedure tipoClick(Sender: TObject);
    procedure BCancelaClick(Sender: TObject);
    procedure nomecampoEnter(Sender: TObject);
    procedure tamanhoEnter(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BMeioClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure tamanhoExit(Sender: TObject);
    procedure decimalExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function acerto(nome:string;tamanho:integer):string;
    function MontaReg(wdescricao:string) : boolean;
  end;

var
  FrmCriaEstrutura: TFrmCriaEstrutura;
  wnome : string[12];
  wtipo : string[2];
  wdecimal,wtamanho : string[3];

implementation

{$R *.DFM}

uses FCadFormulaMT;
//FFormula;

function TFrmCriaEstrutura.MontaReg(wdescricao:string) : boolean;
var
nome,tipo,tamanho,decimal,selecao : string;
fim,fim1 : integer;
begin
 descricao.Clear;
 fim :=  pos('.',wdescricao);
 selecao := wdescricao;
 try
    while (pos(';',wdescricao) > 0) do begin
          fim1 :=  pos(';',wdescricao);
          selecao := copy(wdescricao,1,fim1 - 1);
          wdescricao := copy(wdescricao,fim1+1,fim - fim1 +1);
          nome := copy(selecao,1,pos(',',selecao) - 1);
          nome := acerto(nome,12);
          delete(selecao,1,pos(',',selecao));
          tipo :=  copy(selecao,1,pos(',',selecao) - 1);
          delete(selecao,1,pos(',',selecao));
          if tipo <> 'N' then begin
             tamanho := copy(selecao,1,fim - 1);
             tamanho := acerto(tamanho,3);
             decimal := '';
          end else begin
              tamanho := copy(selecao,1,pos(',',selecao) - 1);
              tamanho := acerto(tamanho,3);
              delete(selecao,1,pos(',',selecao));
              decimal := copy(selecao,1,fim - 1);
              decimal := acerto(decimal,3);
          end;
          tipo := tipo+'#';
          descricao.items.add(nome+tipo+tamanho+decimal);
    end;
 except begin
             MsgDlg('Problemas na edição da formula.','Atenção',mterror,[mbOk],0);
        end;
 end;
 // ULTIMO REGISTRO - PARTE DO PONTO
 selecao := copy(wdescricao,1,fim);
 nome := copy(selecao,1,pos(',',selecao) - 1);
 nome := acerto(nome,12);
 delete(selecao,1,pos(',',selecao));
 tipo :=  copy(selecao,1,pos(',',selecao) - 1);
 delete(selecao,1,pos(',',selecao));
 if tipo <> 'N' then begin
    fim :=  pos('.',selecao);
    tamanho := copy(selecao,1,fim - 1);
    tamanho := acerto(tamanho,3);
 end else begin
     tamanho := copy(selecao,1,pos(',',selecao) - 1);
     tamanho := acerto(tamanho,3);
     delete(selecao,1,pos(',',selecao));
     fim :=  pos('.',selecao);
     decimal := copy(selecao,1,fim - 1);
     decimal := acerto(decimal,3);
 end;
 tipo := tipo+'#';
 if tipo = 'N#'then
  descricao.items.add(nome+tipo+tamanho+decimal)
 else
  descricao.items.add(nome+tipo+tamanho);

 MontaReg := true;

end;

function TFrmCriaEstrutura.acerto(nome:string;tamanho:integer):string;
var
i,j,k : integer;
begin
 i := length(nome);
 if tamanho > i then begin
    j := tamanho - i;
    for k := 1 to j do
        if k = j then
           nome := nome
        else
            nome := nome + ' ';
 end;
 acerto := nome+ '#';
end;

procedure TFrmCriaEstrutura.BincluiClick(Sender: TObject);
begin
 if strtoint(tamanho.text) <= 0 then begin
    MsgDlg('Tamanho tem que ser maior que zero.','Atenção',mterror,[mbOk],0);
    tamanho.setfocus;
    exit;
 end;
 if strtoint(tamanho.text) <= strtoint(decimal.text) then begin
    MsgDlg('Tamanho tem que ser maior que decimal.','Atenção',mterror,[mbOk],0);
    tamanho.setfocus;
    exit;
 end;
 wnome    := uppercase(acerto(nomecampo.text,12));
 wtipo    := copy(tipo.items[tipo.itemindex],1,1)+'#';
 wtamanho := acerto(tamanho.text,3);
 wdecimal := acerto(decimal.text,3) ;
 if (wtipo = 'N#') then
    descricao.items.Add(wnome+wtipo+wtamanho+wdecimal)
 else
     descricao.items.Add(wnome+wtipo+wtamanho);
 nomecampo.setfocus;
end;

procedure TFrmCriaEstrutura.BsaidaClick(Sender: TObject);
begin
 close;
end;

procedure TFrmCriaEstrutura.nomecampoExit(Sender: TObject);
begin
if length(nomecampo.text) > 12 then begin
   MsgDlg('Campo com no máximo 12 caracteres.','Atenção',mterror,[mbOk],0);
   nomecampo.setfocus;
end;
end;


procedure TFrmCriaEstrutura.FormShow(Sender: TObject);
begin
 pdecimal.visible := false;
end;

procedure TFrmCriaEstrutura.BexcluiClick(Sender: TObject);
begin
 descricao.Items.delete(descricao.itemindex);
 nomecampo.setfocus;

end;

procedure TFrmCriaEstrutura.BOkClick(Sender: TObject);
var
 ponto,i : integer;
 leitura,saidastr,parte :string;
begin
  if descricao.Items.Count <= 0 then begin
     MsgDlg('Nenhum registro foi montado.','Atenção',mterror,[mbOk],0);
     exit;
  end;
  saidastr := '';
  for i := 0 to descricao.Items.Count - 1  do begin
      leitura := descricao.items[i];
      while pos('#',leitura) > 1 do begin
            ponto := pos('#',leitura);
            parte := trim(copy(leitura,1,ponto - 1));
            saidastr := saidastr+parte+',';
            delete(leitura,1,ponto);
      end;
      delete(saidastr,length(saidastr),1);
      saidastr := saidastr+';' ;
  end;
  delete(saidastr,length(saidastr),1);
  saidastr := saidastr + '.';
  FrmCadFormulaMT.Cds.FieldbyName('EXPRESSAOFORMULA').AsString := 'CAMPOSDESC('+saidastr+')';
  MsgDlg('Estrutura definida.','Atenção',mterror,[mbOk],0);
  close;
end;

procedure TFrmCriaEstrutura.tipoClick(Sender: TObject);
begin
 if tipo.items[tipo.itemindex] = 'Numérico' then
    Pdecimal.visible := true;
end;

procedure TFrmCriaEstrutura.BCancelaClick(Sender: TObject);
begin
 descricao.Clear;
end;

procedure TFrmCriaEstrutura.nomecampoEnter(Sender: TObject);
begin
     nomecampo.text := '';
     pdecimal.visible := false;
     decimal.text := '0';
     tamanho.text := '0';
end;

procedure TFrmCriaEstrutura.tamanhoEnter(Sender: TObject);
begin
     if tipo.items[tipo.itemindex] <> 'Numérico' then
        pdecimal.visible := false;
end;

procedure TFrmCriaEstrutura.FormActivate(Sender: TObject);
var
 formula : string;
 fim  : integer;
begin
 if FrmCadFormulaMT.sbtnAlterar.Down then begin
    Fim := Length(FrmCadFormulaMT.Cds.FieldbyName('EXPRESSAOFORMULA').AsString);
    Formula :=  copy(FrmCadFormulaMT.Cds.FieldbyName('EXPRESSAOFORMULA').AsString,1,fim - 1);
    Delete(Formula,1,11);
    if not MontaReg(Formula) then begin
       MsgDlg('Problema na alteração da formula.','Atenção',mterror,[mbOk],0);
       exit;
    end;
 end;
end;

procedure TFrmCriaEstrutura.BMeioClick(Sender: TObject);
var
i,atual : integer;
begin
 if descricao.itemindex > -1 then begin
    wnome := uppercase(acerto(nomecampo.text,12));
    wtipo := copy(tipo.items[tipo.itemindex],1,1);
    wtamanho := acerto(tamanho.text,3);
    if wtipo <> 'N' then
       wdecimal := ''
    else
        wdecimal := acerto(decimal.text,3);
    wtipo := wtipo+'#';
    descricao.Items.add('');
    atual :=  descricao.itemindex;
    for i := descricao.items.Count -1 downto descricao.itemindex+1 do
        descricao.items[i] :=   descricao.items[i - 1];
    descricao.items[atual] := wnome+wtipo+wtamanho+wdecimal;
 end else
     MsgDlg('Selecionar um registro.','Atenção',mterror,[mbOk],0);
 nomecampo.setfocus;
end;


procedure TFrmCriaEstrutura.Button1Click(Sender: TObject);
begin
  if nomecampo.text = '' then begin
     MsgDlg('Entre com novos valores.','Atenção',mterror,[mbOk],0);
     nomecampo.setfocus;
     exit;
  end;
  if descricao.itemindex > -1 then begin
     wnome := uppercase(acerto(nomecampo.text,12));
     wtipo := copy(tipo.items[tipo.itemindex],1,1);
     if wtipo <> 'N' then
        wdecimal := ''
     else
         wdecimal := acerto(decimal.text,3)+'#'; ;
     wtipo := wtipo+'#';
     wtamanho := acerto(tamanho.text,3);
     descricao.items[descricao.itemindex] := '';
     descricao.items[descricao.itemindex] := wnome+wtipo+wtamanho+wdecimal;
  end else
      MsgDlg('Selecionar um registro.','Atenção',mterror,[mbOk],0);
  nomecampo.setfocus;
end;

procedure TFrmCriaEstrutura.tamanhoExit(Sender: TObject);
begin
 if strtoint(tamanho.text) > 19 then begin
    MsgDlg('Tamanho máximo : 19','Atenção',mterror,[mbOk],0);
    tamanho.setfocus;
    exit;
 end;

end;

procedure TFrmCriaEstrutura.decimalExit(Sender: TObject);
begin
 if strtoint(decimal.text) > 10 then begin
    MsgDlg('Tamanho máximo : 10','Atenção',mterror,[mbOk],0);
    decimal.setfocus;
    exit;
 end;
end;

end.
