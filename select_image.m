function[image,index]=select_image(k,options,images)
  hfig=figure;
  for i=1:k
    subplot(1,k,i);
    h{i}.h = imshow(images(options(i)).image);
    set(h{i}.h, 'buttondownfcn', {@loads_of_stuff,i});
  end
  title(' Select one of the images. Note : close the window when done')

  function loads_of_stuff(src,eventdata,x)
    if get(src,'UserData')
        set(src,'UserData',0)
        title('');
    else
        set(src,'UserData',1)
        title('Selected');
        [filename,user_canc]=imsave(src);
        image=imread(filename);
    end
    fprintf('%s:\n',num2str(x));
    index = x;
  end
uiwait(hfig);
end